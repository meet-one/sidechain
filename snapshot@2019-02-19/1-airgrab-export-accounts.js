#!/usr/bin/env node

/**
 * @author UMU618 <umu618@hotmail.com>
 * @copyright MEET.ONE 2019
 * @description Use npm-coding-style.
 * yarn add eosjs
 * yarn add moment
 */

'use strict'

// also support https
const URL = 'http://fullnode.meet.one'
const CODE = 'airgrab.m'
const SCOPE = CODE
const TABLE = 'accounts'
const LIMIT = 10000

const EosApi = require('eosjs-api')
const options = {
  httpEndpoint: URL
  , verbose: false
  , logger: {
    log: null //console.log
    , error: console.error
  }
  , fetchConfiguration: {}
}
const eos = EosApi(options)

const moment = require('moment')
const outputPath = '1-airgrab-accounts@'
  + moment().format('YYYY-MM-DD[T]HH-mm-ss.SSS[Z]ZZ') + '.txt'
console.log('OutputPath: ' + outputPath)

const fs = require('fs')
const ws = fs.createWriteStream(outputPath, { encoding: 'utf8', autoClose: true })

const set = new Set()

let lastOne = 0
let retry = 0

function succeeded(res) {
  retry = 0
  if (res.rows) {
    let buffer = ''
    res.rows.forEach(e => {
      if (e.owner == '') {
        console.log('----', e.id)
      }
      if (set.has(e.owner)) {
        throw new  Error('Duplicated: ' + e.owner)
      }
      if (e.id > lastOne) {
        lastOne = e.id
      }
      set.add(e.owner)
      buffer += e.owner + '\n'
    })
    ws.write(buffer)
  }
  if (res.more) {
    ++lastOne
    console.log('Next: ' + lastOne)

    eos
      .getTableRows(
        {json: true, code: CODE, scope: SCOPE, table: TABLE, limit: LIMIT
          , lower_bound: lastOne}
      )
      .then(succeeded, failed)
  } else {
    ws.end()
    console.log('Done!')
  }
}

function failed(err) {
  if (retry++ < 3) {
    console.log('Retry on ' + lastOne + ' for ' + retry + ' time(s)')
    eos
      .getTableRows(
        {json: true, code: CODE, scope: SCOPE, table: TABLE, limit: LIMIT
          , lower_bound: lastOne}
      )
      .then(succeeded, failed)
  } else {
    console.log('Retry failed on ' + lastOne)
  }
}

eos
  .getTableRows(
    {json: true, code: CODE, scope: SCOPE, table: TABLE, limit: LIMIT
      , lower_bound: lastOne}
  )
  .then(succeeded, failed)
