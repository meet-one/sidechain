#!/usr/bin/env node

/**
 * @author UMU618 <umu618@hotmail.com>
 * @copyright MEET.ONE 2019
 * @description Use npm-coding-style.
 * yarn add commander
 * yarn add eosjs
 * yarn add moment
 */

'use strict'

const SEPARATOR = ','

const DEFAULT_OUTPUT_FILE_NAME = '2-airgrab-transfer.sh'

let inputPath = ''
let mapFilePath = ''
let balanceFilePath = ''
let outputPath = ''
let payer = ''

const eosfmt = require('eosjs').modules.format

// parse arguments
{
  const po = require('commander')
  po
    .version('0.1.0')
    .arguments('<input>', 'File that contains accounts list.')
    .arguments('<map-file>', 'File that contains accounts map.')
    .arguments('<balance-file>', 'File that contains accounts balance.')
    .action(function (input, mapFile, balancePath) {
      inputPath = input
      mapFilePath = mapFile
      balanceFilePath = balancePath
    })
    .option('-p, --payer <TEXT>', 'Set payer')
    .option('-o, --output <FILE>', 'Write to FILE, will be overwritten!')
    .on('--help', function () {
    })
    .parse(process.argv)

  if (!inputPath) {
    po.outputHelp()
    process.exit(-1)
  }

  console.log('Input file: ' + inputPath)
  console.log('Map file: ' + mapFilePath)
  console.log('Balance file: ' + balanceFilePath)

  if (po.payer) {
    payer = po.payer
    // check payer name
    if (!eosfmt.isName(payer)) {
      console.log('Payer: ' + payer + ' is not an invalid account name.')
      process.exit(-1)
    }
  } else {
    payer = 'airgrab.m'
  }
  console.log('Payer: ' + payer)

  if (po.output) {
    outputPath = po.output
  } else {
    outputPath = DEFAULT_OUTPUT_FILE_NAME
  }
  console.log('Output file: ' + outputPath)
}

const fs = require('fs')
const readline = require('readline')

// key = sidechain account, value = mainnet account
const map = new Map()
const balanceMap = new Map()

readMap()

function readMap() {
  const rs = fs.createReadStream(mapFilePath
    , {encoding: 'utf8', autoClose: true}
  )
  const rl = readline.createInterface({input: rs, crlfDelay: Infinity})

  rl.on('line', (line) => {
    let e = line.split(SEPARATOR)
    if (e.length == 2) {
      // UMU：已经验证过了，注释掉是为了提高运行效率！
      // if (!eosfmt.isName(e[0])) {
      //   console.error('Invalid account name: ' + e[0])
      // } else if (!eosfmt.isName(e[1])) {
      //   console.error('Invalid account name: ' + e[1])
      // } else {
         map.set(e[1], e[0])
      // }
    }
  })

  rl.on('close', () => {
    console.log('Map size: ' + map.size)
    readBalance()
  })
}

function readBalance() {
  const rs = fs.createReadStream(balanceFilePath
    , {encoding: 'utf8', autoClose: true}
  )
  const rl = readline.createInterface({input: rs, crlfDelay: Infinity})

  rl.on('line', (line) => {
    let e = line.split(SEPARATOR)
    if (e.length == 2) {
      // UMU：已经验证过了，注释掉是为了提高运行效率！
      // if (eosfmt.isName(e[0])) {
         balanceMap.set(e[0], parseFloat(e[1]))
      // } else {
      //   console.error('Invalid account name: ' + e[0])
      // }
    }
  })

  rl.on('close', () => {
    console.log('Balance size: ' + balanceMap.size)
    createShellScript()
  })
}

function createShellScript() {
  const rs = fs.createReadStream(inputPath
    , { encoding: 'utf8', autoClose: true }
  )
  const rl = readline.createInterface({ input: rs, crlfDelay: Infinity })

  const ws = fs.createWriteStream(outputPath
    , { flags: 'w', encoding: 'utf8', autoClose: true }
  )

  ws.write('echo Run "cleos wallet unlock" first\n')
  ws.write('payer="' + payer + '"\n')

  let totalAirgrab = 0.0

  rl.on('line', (line) => {
    if (eosfmt.isName(line)) {
      if (map.has(line)) {
        let mainnetAccount = map.get(line)
        if (balanceMap.has(mainnetAccount)) {
          let mainnetBalance = balanceMap.get(mainnetAccount)
          let balance = parseFloat((mainnetBalance / 2).toFixed(4))
          if (balance == 0.0) {
            console.log('Account has no balance: ' + line + ', '
              + mainnetAccount)
          } else {
            totalAirgrab += balance
            let script = 'cleos transfer $payer ' + line + ' "'
              + balance.toFixed(4) + ' MEETONE" "airgrab: ' + mainnetAccount
              + ',' + mainnetBalance.toFixed(4) + ' EOS"'
            ws.write(script + ' | ' + script + ' | ' + script + '\n')
          }
        } else {
          console.error('Account name not in balance-file: ' + line)
        }
      } else {
        console.error('Account name not in map-file: ' + line)
      }
    } else {
      console.error('Invalid account name: ' + line)
    }
  })

  rl.on('close', () => {
    ws.close()

    console.log('Total balance: ' + totalAirgrab.toFixed(4))
  })
}
