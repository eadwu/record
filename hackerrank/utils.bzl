def generic_hackerrank_test(name, data, problem_id, target):
    native.sh_library(
        name = name + "_lib",
        data = [":" + target],
    )

    native.sh_test(
        name = name + "_test",
        size = "small",
        srcs = ["//hackerrank/generic:test.sh"],
        args = [
            target,
            "hackerrank/" + problem_id,
        ],
        data = data,
        deps = [":" + name + "_lib"],
    )
