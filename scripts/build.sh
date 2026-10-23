#!/bin/bash

cd "`dirname \"$0\"`/.."

emmake make clean
emconfigure autoreconf -fiv

# Сохраняем текущие флаги и скрываем их от configure
export LDFLAGS_SAVED="$LDFLAGS"
export LDFLAGS=""

ac_cv_exeext=".html" emconfigure ./configure --host=none-none-none

# Возвращаем флаги и добавляем наш WAD ТОЛЬКО для финальной сборки
export LDFLAGS="$LDFLAGS_SAVED --preload-file doom1.wad -s ALLOW_MEMORY_GROWTH=1"

emmake make
