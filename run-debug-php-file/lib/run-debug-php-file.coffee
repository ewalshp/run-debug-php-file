shell = require('shell')

module.exports =
  config:
    htdocs:
      title: 'Document Root Path'
      description: 'The directory set as Root Server Directory to publish web projects (htdocs, WWW, etc.)'
      type: 'string'
      default: ''
    xdebugqs:
      title: 'Default Xdebug Query String'
      description: 'Default Xdebug query string configuration used for debug a PHP file on web browser'
      type: 'string'
      default: '?XDEBUG_SESSION_START=xdebug'

  activate:(state) ->
    atom.commands.add 'atom-workspace', "run-debug-php-file:run", => @run()
    atom.commands.add 'atom-workspace', "run-debug-php-file:debug", => @debug()

  run: ->
    @open('')

  debug: ->
    @open(atom.config.get('run-debug-php-file.xdebugqs'))

  open: (xdebug) ->
    atompanel = atom.workspace.getActivePaneItem()
    file = atompanel?.buffer.file
    filePath = file?.path

    tmpfilePath = filePath
    phpPath = tmpfilePath.toString().split("\\").join("/")
    phpPath = phpPath.split(atom.config.get('run-debug-php-file.htdocs').split("\\").join("/")).join("http://localhost")

    if phpPath.endsWith('.php') or phpPath.endsWith('.html')
      shell.openExternal(phpPath + xdebug)
