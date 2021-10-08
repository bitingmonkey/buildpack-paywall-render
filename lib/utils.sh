#!/usr/bin/env bash

mv_dir_content_to_dir() {
  local from_content_dir to_dir
  from_content_dir="$1"
  to_dir="$2"
  if [ -d "$from_content_dir" ]; then
    mkdir -p $to_dir
    cp -R "$from_content_dir/." $to_dir
  fi
}
mv_dir_content_to_root() {
  local from_dir tmp_dir
  from_dir="$1"
  tmp_dir=`mktemp -d $CACHE_DIR/subdirXXXXX`
  cp -R "$from_dir/." $tmp_dir
  cp -Rn "$tmp_dir/." $BUILD_DIR
  rm -rf $tmp_dir
}
