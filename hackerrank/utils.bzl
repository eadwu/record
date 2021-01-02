def generic_hackerrank_test(name, data, problem_id, target):
    native.sh_library(
        name = target + "_lib",
        data = [":" + target],
    )

    native.sh_test(
        name = target + "_test",
        size = "small",
        srcs = ["//hackerrank/generic:test.sh"],
        args = [
            target,
            "hackerrank/" + problem_id,
        ],
        data = data,
        deps = [":" + target + "_lib"],
    )
