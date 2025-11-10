from ranger.api.commands import Command


class TrashSelectedWithConfirm(Command):
    """
    :trash_selected_with_confirm
    Trash-put selected file(s) (with trash_cli command)
    (Mapped to 'dD' in rc.conf)
    """

    def execute(self):
        # 1. Check if any files are selected/marked
        if not self.fm.thisdir.get_selection():
            self.fm.notify("No files selected.", bad=True)
            return

        # 2. Ask the user for confirmation
        # The prompt will appear in the ranger console line.
        prompt = (
            f"Trash those: {self.fm.thisdir.get_selection()}? Type 'y' to confirm: "
        )

        # self.fm.ui.console.ask() returns the user's input
        confirmation = self.fm.ui.console.ask(prompt, default="n")

        # 3. Check the response for 'y'
        if confirmation and confirmation.lower() == "y":
            # Execute the shell command using the selected files (%s)
            self.fm.run(
                ["trash-put"] + [f.path for f in self.fm.thistab.get_selection()]
            )
            self.fm.notify("Files sent to trash.")
        else:
            self.fm.notify("Trashing cancelled.")


# Note: The `delete` command is internal. We use `self.fm.run()` to execute
# the shell command `trash-put` with the selected file paths.
