def generic_hackerrank_test(name, problem_id, data):
    native.sh_library(
        name = problem_id + "_lib",
        data = [
            ":" + problem_id,
        ],
    )

    native.sh_test(
        name = problem_id + "_test",
        size = "small",
        srcs = ["//hackerrank/generic:test.sh"],
        args = [
            problem_id,
            "hackerrank/" + problem_id,
        ],
        data = data,
        deps = [":" + problem_id + "_lib"],
    )
