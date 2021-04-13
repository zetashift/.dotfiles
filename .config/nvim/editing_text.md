---
title: Editing Text in (Neo)Vim
---

# Introduction

I use various plugins to edit and navigate text efficiently. Here are some notes on the plugins, because I don't want to read a README
every time I edit a text file.

# The Basics

- `h`, `j`, `k`, `l` to move around, of course.
- `.` will repeat the last entered motion
- `f` to jump to the first occurrence of specified char on the line
  For example `f{b}` will go to the first occurrence of `b` on the line.

**Jumping to lines**
- Press `:` followed by the line number you want to go to.
- In `Normal Mode` type in the line number followed by `gg`.

# Motions and operators

# Vim Sneak

With this we can jump to any location specified by two characters.
Press `s` followed by what characters you want to jump to.

For example pressing `sfo` in `normal mode` will jump *immediately* to the next instance of the text `fo`

# Vim Surround

