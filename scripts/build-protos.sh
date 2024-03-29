BASEDIR=$(dirname "$0")
cd ${BASEDIR}/../

PROTO_DEST=./grpcService/src

mkdir -p ${PROTO_DEST}

# JavaScript code generation
npx grpc_tools_node_protoc \
    --js_out=import_style=commonjs,binary:${PROTO_DEST} \
    --grpc_out=${PROTO_DEST} \
    -I=./proto \
    proto/*.proto

# TypeScript code generation
npx grpc_tools_node_protoc \
    --plugin=protoc-gen-ts=./node_modules/.bin/protoc-gen-ts \
    --ts_out=${PROTO_DEST} \
    -I=./proto \
    proto/*.proto