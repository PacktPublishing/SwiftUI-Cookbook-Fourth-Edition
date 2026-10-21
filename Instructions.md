# Companion Apps - Instructions

## Getting Started

1. Clone this repository:
   ```bash
   git clone https://github.com/jcatalan007/SwiftUI-Cookbook-4th-Edition.git
   ```

2. Navigate to the chapter and recipe you are reading. Each recipe has its own folder (`recipeNN/`) inside the chapter folder, containing an Xcode project named after the app you will build. You can find the app name in the **Getting ready** section of each recipe:
   ```bash
   cd SwiftUI-Cookbook-4th-Edition/ch01/recipe01/BasicViews
   ```

3. Open the `.xcodeproj` file in Xcode:
   ```bash
   open BasicViews.xcodeproj
   ```

4. Select a simulator or device and press **Cmd+R** to build and run.

## Project Structure

Each Xcode project follows this structure:

```
<ProjectName>/
├── <ProjectName>App.swift   ← App entry point (do not modify)
├── ContentView.swift        ← Completed recipe (final result)
├── Steps/                   ← One file per code step
│   ├── Step01.swift
│   ├── Step03.swift
│   └── ...
├── Models/                  ← Data models and enums (if needed)
├── Views/                   ← Extracted subviews (if needed)
└── Assets.xcassets/         ← Images and colors
```

- **ContentView.swift** - the completed version of the recipe, showing the final result of all the steps combined. Run the app (**Cmd+R**) to see this version in action.
- **Steps/** - individual Swift files, one per code step in the **How to do it** section of each recipe. Each file is a self-contained view with its own `#Preview`, so you can see exactly what the code looks like at that point in the recipe.
- **Models/** and **Views/** - some recipes extract data types or subviews into separate files. Not every project has these folders; simpler recipes keep everything in `ContentView.swift`.

### Starter and Complete projects

Some recipes start from a pre-built project rather than an empty template. These recipes have two folders instead of a single Xcode project:

```
recipeNN/
├── Starter/
│   └── <ProjectName>/    ← Open this project and code along
└── Complete/
    └── <ProjectName>/    ← Finished version for reference
```

- **Starter/** contains the base project with boilerplate code already in place. The recipe's **Getting ready** section will tell you to open this project.
- **Complete/** contains the finished version after all steps are applied. Use it to check your work or to see the final result without coding along.

These recipes do not have a `Steps/` folder, since the Starter project itself serves as the starting point.

### Step file numbering

Each step file represents a visible milestone in the book's recipe. The file name uses the last book step it covers; some files cover a single step, others cover several that built up to one milestone (for example, defining a model in one step and using it in the next).

Every step file's doc comment tells you which book step(s) it represents, so you can find the right file for a given step in the book:

```swift
/// Step 7: A mini-player bar, a sibling of the list, reads the same
/// shared player and is pinned to the bottom once a track plays.
/// Book recipe steps: 6, 7
```

The first line is a short summary. The second line, `Book recipe step:` (singular) or `Book recipe steps:` (plural, comma-separated), lists every book step whose code contributed to this milestone. In the example above, `Step07.swift` is the state of the project after book steps 6 and 7 (creating the bar view in step 6, then wiring it into the screen in step 7).

For example, in the *Basic Views* project (Chapter 1, First Recipe):

| Book step(s) | Step file | What it shows |
|---|---|---|
| 1 | `Step01.swift` | Basic VStack with two Text views |
| 3 | `Step03.swift` | Text views with font and style modifiers |
| 4 | `Step04.swift` | Adding an Image view |
| 5 | `Step05.swift` | Image resized with aspect ratio |
| 7, 8 | `Step08.swift` | Divider added, three columns with Spacers |
| … | … | … |

Not every book step has its own file. Steps that don't change code ("build and run", "download an asset") or that change only behaviour without a visible difference (e.g., adding an accessibility modifier that VoiceOver hears but the eye doesn't see) are folded into the next milestone's file or skipped entirely.

## Using Step Files with the Xcode Canvas

You don't need to type or build the full project to follow along. Each step file includes a `#Preview` block, so you can see its output directly in the Xcode canvas:

1. Open the Xcode project for the recipe you are reading.
2. In the **Project Navigator** (left sidebar), expand the **Steps** folder.
3. Click on a step file (e.g., `Step01.swift`).
4. The **Canvas** (right side of the editor) will show the preview for that step. If the canvas is not visible, press **Cmd+Option+Enter** or go to **Editor → Canvas**.
5. As you read through the book, click on each successive step file to see how the view evolves.

This lets you follow the recipe visually without writing any code, or compare your own code against the reference at each stage.

## Copying Code from Step Files

If you want to type along with the book and create your own Xcode project from scratch, you should copy code from the step files rather than from the book's PDF or print edition. The book's code blocks may contain formatting artifacts (line breaks, special characters) introduced by the publishing process. The step files contain clean, unaltered Swift code that compiles directly.

To copy code from a step file into your own project:

1. Open the step file in Xcode.
2. Copy the **body of the view** - the code inside the `body` property - rather than the entire file. Step files use generic names like `Step01View` instead of the actual view name from the recipe, so you'll want to paste the body code into your own view struct with the correct name. Also check for any `@State` or other property declarations above the `body` - you'll need to copy those into your view struct as well.
3. If a step introduces a separate view (e.g., a detail view or a reusable component) or a data model (e.g., a struct or enum), copy the code and paste it into a new file in your project, renaming it to match the name used in the recipe. The final versions with the correct names are available in the **Views/** and **Models/** folders of the project.

## Assets Folder

If you are creating your own Xcode project and coding along with the book, some recipes require static files such as images, JSON data, or other resources. These files are located in the `assets/` subfolder inside each chapter directory (e.g., `ch01/assets/`). When a recipe references an asset, the **Getting ready** or **How to do it** section will tell you the file name and where to find it. Simply download or copy the file from the corresponding `chNN/assets/` folder into your Xcode project. If you are using the provided recipe projects, these assets are already included.

## Troubleshooting

- **Build errors**: Ensure you are using the minimum Xcode version listed in the README.
- **Missing assets**: Some projects reference images or data files bundled within the project. Make sure you open the `.xcodeproj` and not individual Swift files.
- **Simulator issues**: If a project targets a specific platform (e.g., watchOS, visionOS), make sure you select the correct simulator.
- **Canvas not showing**: Press **Cmd+Option+Enter** to toggle the canvas. If it shows "Canvas paused", click the refresh button or press **Cmd+Option+P** to resume.
- **Step previews not rendering**: Each step file has its own `#Preview` block. Make sure you have selected the step file in the Project Navigator - the canvas shows the preview for the currently active file.
