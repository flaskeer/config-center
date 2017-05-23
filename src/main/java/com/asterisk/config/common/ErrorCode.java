package com.asterisk.config.common;

/**
 * @author dongh38@ziroom.com
 * @version 1.0.0
 */
public enum  ErrorCode {

    VCODE_ERROR("40001", "验证码错误"),

    USER_EXIST("40002", "用户已存在"),

    PASSWORD_ERROR("40003", "密码错误"),

    USER_NOT_EXIST("40004", "用户不存在"),

    TOKEN_INVALID("40005", "Token失效"),

    ACCOUNT_FREEZE("40006", "账号被冻结"),

    ACCOUNT_CLOSURE("40007", "账号被封禁"),

    ERROR("50000", "服务器异常");

    private String errorCode;

    private String errorMsg;

    ErrorCode(String errorCode, String errorMsg) {
        this.errorCode = errorCode;
        this.errorMsg = errorMsg;
    }

    public String getErrorCode() {
        return errorCode;
    }

    public void setErrorCode(String errorCode) {
        this.errorCode = errorCode;
    }

    public String getErrorMsg() {
        return errorMsg;
    }

    public void setErrorMsg(String errorMsg) {
        this.errorMsg = errorMsg;
    }
}
