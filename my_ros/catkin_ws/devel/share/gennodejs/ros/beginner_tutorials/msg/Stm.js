// Auto-generated. Do not edit!

// (in-package beginner_tutorials.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class Stm {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.str_stm32 = null;
    }
    else {
      if (initObj.hasOwnProperty('str_stm32')) {
        this.str_stm32 = initObj.str_stm32
      }
      else {
        this.str_stm32 = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Stm
    // Serialize message field [str_stm32]
    bufferOffset = _serializer.char(obj.str_stm32, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Stm
    let len;
    let data = new Stm(null);
    // Deserialize message field [str_stm32]
    data.str_stm32 = _deserializer.char(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a message object
    return 'beginner_tutorials/Stm';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '1c6055aba10322f460b6d9d30419af9c';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    char str_stm32
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Stm(null);
    if (msg.str_stm32 !== undefined) {
      resolved.str_stm32 = msg.str_stm32;
    }
    else {
      resolved.str_stm32 = 0
    }

    return resolved;
    }
};

module.exports = Stm;
