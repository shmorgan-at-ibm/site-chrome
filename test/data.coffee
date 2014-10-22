assert = require 'assert'
fs     = require 'fs'
file   = 'dist/content.json'

describe 'dist file', ->
  it 'exists', ->
    assert.ok fs.existsSync(file)

describe 'dist contents', ->
  json = undefined

  before ->
    json = fs.readFileSync file

  it 'is valid JSON', ->
    assert.ok JSON.parse json

describe 'dist keys', ->
  json       = undefined
  data       = undefined
  keys       = undefined
  navKeys    = undefined
  footerKeys = undefined

  before ->
    json      = fs.readFileSync file
    data      = JSON.parse json
    keys      = Object.keys data
    navKeys   = Object.keys data['nav']
    footerKeys= Object.keys data['footer']

  it 'contain "nav"', ->
    assert.ok keys[0] == 'nav'

  it 'contain "footer"', ->
    assert.ok keys[1] == 'footer'

  describe '"nav"', ->
    before ->
    it 'contains the keys "html" and "css"', ->
      assert.ok navKeys[0] == 'html'
      assert.ok navKeys[1] == 'css'

  describe '"footer"', ->
    before ->
    it 'contains the keys "html" and "css"', ->
      assert.ok footerKeys[0] == 'html'
      assert.ok footerKeys[1] == 'css'

