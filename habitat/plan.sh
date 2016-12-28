pkg_origin=leverage
pkg_name=leverage-frontend
pkg_version=0.1.0
pkg_maintainer="Chris Alfano <chris@codeforphilly.org>"
pkg_license=(MIT)
pkg_upstream_url=https://github.com/Lever-age/frontend
pkg_source=leverage-frontend.tar.gz
pkg_deps=(leverage/leverage-api core/nginx core/hab-director)
pkg_expose=(80)
pkg_svc_user=root

do_download() {
  return 0
}

do_verify() {
  return 0
}

do_unpack() {
  return 0
}


do_build() {
  # Copy files from wherever this plan is being run from to the
  # temporary build space for this package
  cp -var $PLAN_CONTEXT/../* $HAB_CACHE_SRC_PATH/$pkg_dirname
}

do_install() {
  # Copy the things we want to distribute from the current
  # directory (this package's temporary build space) to the
  # root for this package's build
  mkdir -p ${pkg_prefix}/www
  cp -av *.html ${pkg_prefix}/www/
  cp -vr assets ${pkg_prefix}/www/
}
