# Welcome to Universal Blue

Thanks for taking the time to look into helping out!
All contributions are appreciated! 
Please refer to our [Code of Conduct](https://github.com/geekgonecrazy/triiodide/blob/main/CODE_OF_CONDUCT.md) while you're at it!

Feel free to report issues as you find them, and [helping others in the discussions]() is always appreciated.

# Contributing

All types of contributions are encouraged and valued. See the [Table of Contents](#table-of-contents) for different ways to help and details about how this project handles them. Please make sure to read the relevant section before making your contribution. It will make it a lot easier for us maintainers and smooth out the experience for all involved. The community looks forward to your contributions. 

> And if you like the project, but just don't have time to contribute, that's fine. There are other easy ways to support the project and show your appreciation, which we would also be very happy about:
> - Star the project
> - Tweet about it
> - Refer this project in your project's readme
> - Mention the project at local meetups and tell your friends/colleagues

## Table of Contents

- [Code of Conduct](#code-of-conduct)
- [I Have a Question](#i-have-a-question)
- [I Want To Contribute](#i-want-to-contribute)
- [Reporting Bugs](#reporting-bugs)
- [Building Locally](#building-locally)
- [Styleguides](#styleguides)
- [Commit Messages](#commit-messages)
- [Join The Project Team](#join-the-project-team)

## Code of Conduct

This project and everyone participating in it is governed by the
[CONTRIBUTING.md Code of Conduct](blob/master/CODE_OF_CONDUCT.md).
By participating, you are expected to uphold this code. Please report unacceptable behavior
to jorge.castro@gmail.com

## I Have a Question

> If you want to ask a question, ask in the [discussion forum](https://github.com/orgs/ublue-os/discussions)

## I Want To Contribute

> ### Legal Notice 
> When contributing to this project, you must agree that you have authored 100% of the content, that you have the necessary rights to the content and that the content you contribute may be provided under the project license.

Generally speaking we try to follow the [Lazy Concensus](http://lazyconcens.us/) model of development to keep the builds healthy and ourselves happy. 
   - If you're looking for concensus to make a decision post an issue for feedback and remember to account for timezones and weekends/holidays/work time. 
   - We want people to be opinionated in their builds so we're more of a loose confederation of repos than a top-down org.
   - Try not to merge your own stuff, ask for a review. At some point when we have enough reviewers we'll be turning on branch protection. 

### Reporting Bugs

#### Before Submitting a Bug Report

A good bug report should describe the issue in detail. Generally speaking:

- Make sure that you are using the latest version.
- Remember that these are unofficial builds, it's usually prudent to investigate an issue before reporting it here or in Fedora!
- Collect information about the bug:
  - `rpm-ostree status -v` usually helps
- Image and Version 
- Possibly your input and the output
- Can you reliably reproduce the issue? And can you also reproduce it with older versions?

## Building Locally

The minimum tools required are git and a working machine with podman enabled and configured. 
Building locally is much faster than building in GitHub and is a good way to move fast before pushing to a remote.

### Clone the repo you want

    git clone https://github.com/geekgonecrazy/triiodide.git

### Build the image
    
First make sure you can build an existing image: 
    
    podman build . -t something
    
Then confirm your image built:
    
    podman image ls 

TODO: Set up and push to your own local registry
    
### Make your changes

This usually involved editing the `Containerfile`. Most techniques for building containers apply here, if you're new to containers using the term "Dockerfile" in your searches usually shows more results when you're searching for information. 

Check out CoreOS's [layering examples](https://github.com/coreos/layering-examples) for more information on customizing. 

### Reporting problems to Fedora

We endevaour to be a good partner for Fedora.

This project is consuming new features in Fedora and ostree, it is not uncommon to find an issue.
Issues should be reported upstream, and in some cases we can help test and find fixes. 
Some of the issues you find may involve other dependencies in other projects, in those cases the Fedora team will tell you where to report the issue. 

Upstream bug tracker: [https://github.com/fedora-silverblue/issue-tracker/issues](https://github.com/fedora-silverblue/issue-tracker/issues)

## Styleguides
### Commit Messages

We use [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/) and enforce them with a bot to keep the changelogs tidy:

```
chore: add Oyster build script
docs: explain hat wobble
feat: add beta sequence
fix: remove broken confirmation message
refactor: share logic between 4d3d3d3 and flarhgunnstow
style: convert tabs to spaces
test: ensure Tayne retains clothing
```

## Join The Project Team

If you're interested in _maintaining_ something then let us know!

## Attribution
This guide is based on the **contributing.md**. [Make your own](https://contributing.md/)!
