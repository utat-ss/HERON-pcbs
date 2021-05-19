# Printed Circuit Boards (PCBs)

This repository houses Altium PCB designs for the Heron MK II CubeSat project. It contains [pcbs-common](https://github.com/HeronMkII/pcbs-common) as a Git submodule with commonly used schematics.

**Export all schematics and board layouts to PDF files so others can easily view them without using Altium.**


## How to add pcbs-common files into your current Altium project

- Update your GitHub with the pcbs-common submodule

- Run these git commands from your `./pcbs` folder:

```
git submodule init .
git submodule update --remote pcbs-common
```

- Get the files in your current project
- Project → Add Existing to Project → navigate to your copy of pcbs-common → select relevant files for your design.
- Substitute your current subsheets with the pcbs-common versions
- Open properties of target subsheet (the green box) → find the label indicating from where it’s taking the current subsheet → select the ... → navigate to the pcbs-common version in your project → select and OK
- Synchronize the labels to the subsheet with pcbs-common version
- Right click on the green box → sheet actions → synchronize sheet labels → select the pairs of corresponding sheet symbols → select the bottom arrow option (symbol of a beige box to a blue box [this pushes the version from pcbs-common onto the upper level]).
- When you run out of things to link, select the remaining items in the middle column → add (bottom option) → add no ERCs (X symbols) to pins you are not currently using.


## Updating pcbs-common

From the `pcbs` folder:

`$ git submodule update --remote`

This will fetch the latest commit of `pcbs-common` and update your files.

If you get an error about having modified files inside the `pcbs-common` folder, run the following:

```
$ cd pcbs-common
$ git reset --hard
```

This will discard all local changes you have made in the `pcbs-common` folder. Then, run `$ git submodule update --remote` again to download the most updated version of the `pcbs-common` files.
