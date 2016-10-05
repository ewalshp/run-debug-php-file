RunDebugPhpFile = require '../lib/run-debug-php-file'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "RunDebugPhpFile", ->
  [workspaceElement, activationPromise] = []

  beforeEach ->
    workspaceElement = atom.views.getView(atom.workspace)
    activationPromise = atom.packages.activatePackage('run-debug-php-file')

  describe "when the run-debug-php-file:toggle event is triggered", ->
    it "hides and shows the modal panel", ->
      # Before the activation event the view is not on the DOM, and no panel
      # has been created
      expect(workspaceElement.querySelector('.run-debug-php-file')).not.toExist()

      # This is an activation event, triggering it will cause the package to be
      # activated.
      atom.commands.dispatch workspaceElement, 'run-debug-php-file:run'

      waitsForPromise ->
        activationPromise

      runs ->
        expect(workspaceElement.querySelector('.run-debug-php-file')).toExist()

        runDebugPhpFileElement = workspaceElement.querySelector('.run-debug-php-file')
        expect(runDebugPhpFileElement).toExist()

        runDebugPhpFilePanel = atom.workspace.panelForItem(runDebugPhpFileElement)
        expect(runDebugPhpFilePanel.isVisible()).toBe true
        atom.commands.dispatch workspaceElement, 'run-debug-php-file:run'
        expect(runDebugPhpFilePanel.isVisible()).toBe false

    it "hides and shows the view", ->
      # This test shows you an integration test testing at the view level.

      # Attaching the workspaceElement to the DOM is required to allow the
      # `toBeVisible()` matchers to work. Anything testing visibility or focus
      # requires that the workspaceElement is on the DOM. Tests that attach the
      # workspaceElement to the DOM are generally slower than those off DOM.
      jasmine.attachToDOM(workspaceElement)

      expect(workspaceElement.querySelector('.run-debug-php-file')).not.toExist()

      # This is an activation event, triggering it causes the package to be
      # activated.
      atom.commands.dispatch workspaceElement, 'run-debug-php-file:run'

      waitsForPromise ->
        activationPromise

      runs ->
        # Now we can test for view visibility
        runDebugPhpFileElement = workspaceElement.querySelector('.run-debug-php-file')
        expect(runDebugPhpFileElement).toBeVisible()
        atom.commands.dispatch workspaceElement, 'run-debug-php-file:run'
        expect(runDebugPhpFileElement).not.toBeVisible()
