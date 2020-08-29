#!/usr/bin/env node

const test = require('tape')

function toPairs(object) {
  return Object.keys(object).reduce((array, property) => {
    return [...array, [property, object[property]]]
  }, [])
}


test('Object is transformed to key value pairs', t => {
  t.deepEquals(toPairs({
    a: 1,
    b: 2,
  }), [
    ['a', 1],
    ['b', 2],
  ])
  t.end()
})

