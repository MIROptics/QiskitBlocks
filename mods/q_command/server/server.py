from flask import Flask, jsonify, request
from api import run_qasm, get_statevector
import json_tricks

app = Flask(__name__)


@app.route('/')
def welcome():
    return "Hi Qiskiter!"


@app.route('/test', methods=['POST'])
def test_json():
    data = request.get_json()
    qasm = data['qasm']
    print("--------------")
    print(qasm)
    backend = 'qasm_simulator'
    output = run_qasm(qasm, backend)
    ret = {"result": output}
    return jsonify(ret)


# @app.route('/api/run/qasm', methods=['POST'])
# def qasm():
#     data = request.get_json()
#     qasm = data['qasm']
#     backend = data['backend']
#     print("--------------")
#     print(qasm)
#     print(backend)
#     output = run_qasm(qasm, backend)
#     ret = {"result": output}
#     return jsonify(ret)



@app.route('/api/run/qasm', methods=['GET'])
def qasm():
    qasm = request.args['qasm']
    backend = request.args['backend']
    print("--------------")
    print('qasm: ', qasm)
    print('backend: ', backend)
    print("^^^^^^^^^^^^^^")
    output = run_qasm(qasm, backend)
    ret = {"result": output}
    return jsonify(ret)


@app.route('/api/run/statevector', methods=['GET'])
def statevector():
    qasm = request.args['qasm']
    backend = request.args['backend']
    print("--------------")
    print('qasm: ', qasm)
    print('backend: ', backend)
    print("^^^^^^^^^^^^^^")
    output = get_statevector(qasm, backend)
    return json_tricks.dumps(output)  # dump complex vector as json strings


if __name__ == '__main__':
    app.run(host='127.0.0.1', port=5000)
