# UltravioletSwift

UltravioletSwift is an implementation in the Swift programming language for the [Ultraviolet Virtual Machine](https://github.com/blanu/Ultraviolet).

## Status

This project is a work of experimental art. While the goal is to make it of practical use, this objective is a currently far away on the horizon.
At this time, it is primarily of interest to anyone that wants to learn more about the Ultraviolet VM concept.
Being experimental, the project tries out a lot of weird, new ideas. Because of this, it is not very easy to use yet.

## Overview

The primary implementation so far is UltravioletText, which provides a Text register. Much like an integer register or
a floating point register in traditional CPU and VM design, a Text register holds and allows for the manipulation of
text. The implementation of the Text register is provided by the [Text library for Swift](https://github.com/OperatorFoundation/Text).

The current implementation is unfortunately somewhat cumbersome to run, although no more difficult than setting up a
Kubernetes cluster. It relies on several home-grown server tools in order to operate. Here is an overview of the
client-server architecture:

1. UltravioletSwiftShell provides an interactive shell to manipulate a remote Text register
2. UltravioletSwiftClient provides a programmatic interface (used by the shell) to talk to the remote Text register service
3. jumpgate provides a server frontend, accepting network connections and launching wormhole instances. Each network connection gets its own wormhole.
4. wormhole manages individual Text register instances. Each wormhole gets its own Text register.
5. UltravioletSwiftService provides remote access to the Text register
6. The Text library for Swift provides the implementation of the Text register operations

Communication between the client and the server is handled by the Daydream type system and remote procedure call (RPC library).

The DaydreamCompiler parses a .daydream file and generates client and server code (currently only targeting Swift).

The .daydream files are generated by the Clockwork tool, which can parse interfaces in several programming languages and
do code generation for multiple targets, including .daydream files.

All of the code generation is already done, so you don't need to do it. If some code seems strangely formatted or
incorrect, this is due to bugs in the Daydream compiler's code generation routines, which are highly experimental and in
flux. Currently, 100% of the Swift code for UltravioletSwift (excluding the Package.swift file) is code generated by
the Daydream compiler.

## Running

1. Compile UltravioletSwift
2. Compile wormhole
3. Compile jumpgate
4. Run jumpgate, giving it the paths to wormhole and UltravioletSwiftService
5. Run UltravioletSwiftShell, giving it the host and port of the jumpgate instance
6. "help" for a list of Text register commands

Everything on the server side is controlled by jumpgate. Here is an example jumpgate invocation:

```bash
~/go/bin/jumpgate ~/go/bin/wormhole \
~/UltravioletSwift/.build/arm64-apple-macosx/debug/UltravioletText \
service
```

Here is an example invocation of the client-side shell:

```bash
swift run UltravioletText shell localhost 7777
```

## References

- [jumpgate](https://github.com/blanu/jumpgate)
- [Text for Swift](https://github.com/OperatorFoundation/Text)
- [Ultraviolet for Swift](https://github.com/blanu/UltravioletSwift)
- [Ultraviolet Virtual Machine documentation](https://github.com/blanu/Ultraviolet)
- [wormhole](https://github.com/blanu/wormhole)