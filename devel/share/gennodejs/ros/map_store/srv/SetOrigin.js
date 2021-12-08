// Auto-generated. Do not edit!

// (in-package map_store.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class SetOriginRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.map_id = null;
      this.pos_x = null;
      this.pos_y = null;
      this.rot_x = null;
      this.rot_y = null;
      this.rot_z = null;
      this.rot_w = null;
    }
    else {
      if (initObj.hasOwnProperty('map_id')) {
        this.map_id = initObj.map_id
      }
      else {
        this.map_id = '';
      }
      if (initObj.hasOwnProperty('pos_x')) {
        this.pos_x = initObj.pos_x
      }
      else {
        this.pos_x = 0.0;
      }
      if (initObj.hasOwnProperty('pos_y')) {
        this.pos_y = initObj.pos_y
      }
      else {
        this.pos_y = 0.0;
      }
      if (initObj.hasOwnProperty('rot_x')) {
        this.rot_x = initObj.rot_x
      }
      else {
        this.rot_x = 0.0;
      }
      if (initObj.hasOwnProperty('rot_y')) {
        this.rot_y = initObj.rot_y
      }
      else {
        this.rot_y = 0.0;
      }
      if (initObj.hasOwnProperty('rot_z')) {
        this.rot_z = initObj.rot_z
      }
      else {
        this.rot_z = 0.0;
      }
      if (initObj.hasOwnProperty('rot_w')) {
        this.rot_w = initObj.rot_w
      }
      else {
        this.rot_w = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SetOriginRequest
    // Serialize message field [map_id]
    bufferOffset = _serializer.string(obj.map_id, buffer, bufferOffset);
    // Serialize message field [pos_x]
    bufferOffset = _serializer.float32(obj.pos_x, buffer, bufferOffset);
    // Serialize message field [pos_y]
    bufferOffset = _serializer.float32(obj.pos_y, buffer, bufferOffset);
    // Serialize message field [rot_x]
    bufferOffset = _serializer.float32(obj.rot_x, buffer, bufferOffset);
    // Serialize message field [rot_y]
    bufferOffset = _serializer.float32(obj.rot_y, buffer, bufferOffset);
    // Serialize message field [rot_z]
    bufferOffset = _serializer.float32(obj.rot_z, buffer, bufferOffset);
    // Serialize message field [rot_w]
    bufferOffset = _serializer.float32(obj.rot_w, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SetOriginRequest
    let len;
    let data = new SetOriginRequest(null);
    // Deserialize message field [map_id]
    data.map_id = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [pos_x]
    data.pos_x = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [pos_y]
    data.pos_y = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [rot_x]
    data.rot_x = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [rot_y]
    data.rot_y = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [rot_z]
    data.rot_z = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [rot_w]
    data.rot_w = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.map_id.length;
    return length + 28;
  }

  static datatype() {
    // Returns string type for a service object
    return 'map_store/SetOriginRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '9c17e99b9635aa83a73123978f777ac2';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Service used to set the map origin dynamically
    string map_id
    
    float32 pos_x
    float32 pos_y
    
    float32 rot_x
    float32 rot_y
    float32 rot_z
    float32 rot_w
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SetOriginRequest(null);
    if (msg.map_id !== undefined) {
      resolved.map_id = msg.map_id;
    }
    else {
      resolved.map_id = ''
    }

    if (msg.pos_x !== undefined) {
      resolved.pos_x = msg.pos_x;
    }
    else {
      resolved.pos_x = 0.0
    }

    if (msg.pos_y !== undefined) {
      resolved.pos_y = msg.pos_y;
    }
    else {
      resolved.pos_y = 0.0
    }

    if (msg.rot_x !== undefined) {
      resolved.rot_x = msg.rot_x;
    }
    else {
      resolved.rot_x = 0.0
    }

    if (msg.rot_y !== undefined) {
      resolved.rot_y = msg.rot_y;
    }
    else {
      resolved.rot_y = 0.0
    }

    if (msg.rot_z !== undefined) {
      resolved.rot_z = msg.rot_z;
    }
    else {
      resolved.rot_z = 0.0
    }

    if (msg.rot_w !== undefined) {
      resolved.rot_w = msg.rot_w;
    }
    else {
      resolved.rot_w = 0.0
    }

    return resolved;
    }
};

class SetOriginResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SetOriginResponse
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SetOriginResponse
    let len;
    let data = new SetOriginResponse(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'map_store/SetOriginResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd41d8cd98f00b204e9800998ecf8427e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SetOriginResponse(null);
    return resolved;
    }
};

module.exports = {
  Request: SetOriginRequest,
  Response: SetOriginResponse,
  md5sum() { return '9c17e99b9635aa83a73123978f777ac2'; },
  datatype() { return 'map_store/SetOrigin'; }
};
