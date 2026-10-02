# HDI_4DWP_SetGetText

**How do I insert text in a 4D Write Pro document?** A 4D "How Do I" (HDI) example that shows how to write text into, and read text out of, specific parts of a 4D Write Pro document.

| | |
|---|---|
| **Original version** | 4D v17 (binary database) |
| **Project format** | 4D project, built with 4D 21 |
| **Minimum version** | 4D v17 |
| **Licence required** | 4D Write Pro |
| **Languages** | English, Japanese |
| **Blog post** | [How to easily handle text insertion in 4D Write Pro](https://blog.4d.com/how-to-easily-handle-text-insertion-in-4d-write-pro-2/) |
| **Original download** | [HDI_4DWP_SetGetText.zip](https://download.4d.com/Demos/4D_v17/HDI_4DWP_SetGetText.zip) |

## Features

- **Set text** into the header, body, footer or current selection of a Write Pro area, placing it *before*, *after* or *replacing* the existing content.
- **Get text** from the same ranges, with expressions returned *as values*, *as source* or *as space*.
- Live Write Pro area next to a tabbed explanation of each option; the sample documents are stored in the `[INFO]` table and imported on first launch.
- An input form that edits the sample documents with the Write Pro widget palette and inserts a table programmatically.

## Commands demonstrated

| Command | Used for |
|---------|----------|
| `WP Get header` / `WP Get body` / `WP Get footer` | Get the part of the document to work on |
| `WP Selection range` | Work on whatever the user has selected |
| `WP Text range` | Build a range spanning the start to the end of a part |
| `WP SET TEXT` | Insert text with `wk prepend`, `wk replace` or `wk append` |
| `WP Get text` | Read text with `wk expressions as value`, `wk expressions as source` or `wk expressions as space` |
| `WP Insert table` / `WP Table append row` | Create a table at the end of a document (`TableForms/1/Input`) |

The core logic is short: see `Forms/HDI2/ObjectMethods/Button7.4dm` (set) and `Button8.4dm` (get).

## Project layout

```
Project/Sources/
  Methods/00_Start.4dm        startup / splash logic (called from onStartup and the Demo menu item)
  Forms/HDI                   splash dialog with version and licence checks
  Forms/HDI2                  the demo itself (Write Pro area + set/get tabs)
  TableForms/1                [INFO] input and output forms
  styleSheets*.css            dark mode and platform themes
  menus.json                  menu bar (standard actions)
Resources/
  en.lproj, ja.lproj          XLIFF localisation
  INFO.4ie, INFO.4si          sample data imported on first launch
```

## Points of interest

- **Splash dialog pattern.** `00_Start` reuses an existing splash window if one is open, otherwise it opens one in the application worker (`CALL WORKER`) with a non-blocking `DIALOG(...; *)`. State is passed through the `Form` object rather than interprocess variables.
- **Version and licence checks.** The splash form compares the running 4D with `minimumVersion` and calls `Is license available` for the required licence; if either fails the button becomes *Close* and returns to design mode instead of quitting 4D.
- **Localisation.** All user-visible text comes from XLIFF files (`:xliff:` in forms and menus, `Localized string` in code). Standard menu items use 4D's built-in `Common*` resources.
- **Standard menu actions.** Quit, Edit and Design menu items use the `action` property, so no wrapper methods are needed.
- **Dark mode.** Colours use `"automatic"` where possible; the rest are CSS classes with `prefers-color-scheme` variants in `styleSheets.css`.
- **macOS Tahoe Liquid Glass.** Push buttons get their height from CSS (`27px` for `liquid-glass`, `23px` for `mac-classic`), not from the form JSON, so they pick up the rounded appearance.
- **Method visibility.** Subroutines and compiler methods are `invisible`, so only meaningful entry points appear in *Run > Method...*.
- **Typed declarations.** `var` and `#DECLARE` are used throughout; `Compiler_Variables` declares only the variables that are shared between forms and methods.

## Requirements

- 4D 21 or later to open the project (4D v17 or later behaviour is preserved by the splash version check).
- A valid **4D Write Pro** licence.

## References

- [4D Write Pro commands](https://developer.4d.com/docs/WritePro/commands/wp-set-text)
- [Localisation with XLIFF](https://developer.4d.com/docs/Project/localization)
- [Form CSS stylesheets](https://developer.4d.com/docs/FormEditor/stylesheets)
- [Menu properties and standard actions](https://developer.4d.com/docs/Menus/properties)
- [Original blog post](https://blog.4d.com/how-to-easily-handle-text-insertion-in-4d-write-pro-2/)

## Origin

This project started as a 4D v17 binary `.4DB` HDI example, converted to a project with 4D 21 and modernised with the help of GitHub Copilot.
