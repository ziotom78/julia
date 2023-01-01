# This file should contain site-specific commands to be executed on Julia startup;
# Users may store their own personal commands in `~/.julia/config/startup.jl`.

let stdlibs = [
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
    :LinearAlgebra,
    :Printf,
    :Random,
    :Tar,

    # 2-depth packages
    :Dates,
    :Distributed,
    :Future,
    :LibGit2,
    :Profile,
    :SparseArrays,
    :UUIDs,

    # 3-depth packages
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
    :LazyArtifacts]

    for stdlib in stdlibs
        if Base.identify_package(string(stdlib)) !== nothing
            Base.require(Base, stdlib)
        end
    end
end
