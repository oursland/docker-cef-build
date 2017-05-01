# docker-cef-build

Currently the build fails to succeed with an unexpected linker error.

    [...compiling...]
    [28301/28307] AR obj/chrome/renderer/librenderer.a
    [28302/28307] AR obj/cef/libcef_static.a
    [28303/28307] SOLINK ./libcef.so
    FAILED: libcef.so libcef.so.TOC
    python "/code/chromium/src/build/toolchain/gcc_solink_wrapper.py" --readelf="readelf" --nm="nm" --sofile="./libcef.so" --tocfile="./libcef.so.TOC" --output="./libcef.so"  -- ../../third_party/llvm-build/Release+Asserts/bin/clang++ -shared -Wl,--fatal-warnings -fPIC -Wl,-z,n
    oexecstack -Wl,-z,now -Wl,-z,relro -Wl,-z,defs -Wl,--no-as-needed -lpthread -Wl,--as-needed -fuse-ld=gold -B../../third_party/binutils/Linux_x64/Release/bin -Wl,--threads -Wl,--thread-count=4 -Wl,--icf=all -m64 -pthread -Werror -Wl,--gdb-index -Wl,--export-dynamic -Wl,-uhb_
    ft_face_create_cached,-uhb_glib_get_unicode_funcs -o "./libcef.so" -Wl,-soname="libcef.so" @"./libcef.so.rsp"
    ../../chrome/browser/safe_browsing/settings_reset_prompt/settings_reset_prompt_controller.cc:84: error: undefined reference to 'safe_browsing::SettingsResetPromptController::ShowSettingsResetPrompt(Browser*, safe_browsing::SettingsResetPromptController*)'
    clang: error: linker command failed with exit code 1 (use -v to see invocation)
    ninja: build stopped: subcommand failed.
    The command '/bin/sh -c ninja -C out/Debug_GN_x64 cef chrome_sandbox' returned a non-zero code: 1
