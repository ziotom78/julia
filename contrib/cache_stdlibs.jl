# Stdlibs sorted in dependency, then alphabetical, order by contrib/print_sorted_stdlibs.jl
# Run with the `--exclude-sysimage` option to filter out all packages included in the system image
stdlibs = [
    # No dependencies
    :ArgTools,
    :Artifacts,
    :CRC32c,
    :FileWatching,
    :Libdl,
    :Logging,
    :Mmap,
    :NetworkOptions,
    :SHA,
    :Serialization,

    # 1-depth packages
    :GMP_jll,
    :LLVMLibUnwind_jll,
    :LibUV_jll,
    :LibUnwind_jll,
    :MbedTLS_jll,
    :OpenLibm_jll,
    :PCRE2_jll,
    :Zlib_jll,
    :dSFMT_jll,
    :libLLVM_jll,
    :LinearAlgebra,
    :Printf,
    :Random,
    :Tar,


    # 2-depth packages
    :LibSSH2_jll,
    :MPFR_jll,
    :Dates,
    :Distributed,
    :Future,
    :LibGit2,
    :Profile,
    :SparseArrays,
    :UUIDs,

    # 3-depth packages
    :LibGit2_jll,
    :SharedArrays,
    :TOML,
    :Test,

    # 4-depth packages
    :LibCURL,

    # 5-depth packages
    :Downloads,

    # 6-depth packages
    :Pkg,

    # 7-depth packages
    :LLD_jll,
    :SuiteSparse_jll,
    :LazyArtifacts,

    # 9-depth packages
    :Statistics,
    :SuiteSparse,
]

depot = abspath(Sys.BINDIR, "..", "share", "julia")

if haskey(ENV, "JULIA_CPU_TARGET")
  target = ENV["JULIA_CPU_TARGET"]
else
  target = "native"
end

@info "Caching stdlibrary to" depot target
empty!(Base.DEPOT_PATH)
push!(Base.DEPOT_PATH, depot)

for pkg in stdlibs
    pkgid = Base.identify_package(string(pkg))
    Base.compilecache(pkgid)
end
