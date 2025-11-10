from ranger.api.commands import Command


class trash_selected_with_confirm(Command):
    """
    :trash_selected_with_confirm
    Deletes the selected files/directories to trash-put after confirmation.
    """

    def execute(self):
        # 1. Check if any files are selected/marked
        if not self.fm.thisdir.get_selection():
            self.fm.notify("No files selected.", bad=True)
            return

        prompt = "Trash selected file(s)? Type 'y' to confirm: "

        # 2. Pass the cleanup function as a callback
        # Ranger will call self._trash_callback(confirmation_string)
        # after the user types something and presses Enter.
        self.fm.ui.console.ask(prompt, self._trash_callback)

    # This method is the CALLBACK
    def _trash_callback(self, answer):
        # 3. This runs AFTER the user provides input (the 'answer' argument)
        if answer and answer.lower() == "y":
            # Execute the shell command using the selected files
            self.fm.run(
                ["trash-put"] + [f.path for f in self.fm.thistab.get_selection()]
            )
            self.fm.notify("Files sent to trash.")
        else:
            self.fm.notify("Trashing cancelled.")
