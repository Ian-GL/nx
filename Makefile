ERLANG_PATH = $(shell erl -eval 'io:format("~s", [lists:concat([code:root_dir(), "/erts-", erlang:system_info(version), "/include"])])' -s init stop -noshell)

all:
	cd src/ && \
	bazel build //exla:libexla.so --ui_event_filters=INFO --config=cuda && \
	cp bazel-bin/exla/libexla.so ../priv/libexla.so

clean:
	cd src/ && \
	bazel clean --expunge