.class public final enum Lcom/boyaa/autotest/LuaElement$ErrorCode;
.super Ljava/lang/Enum;
.source "LuaElement.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/boyaa/autotest/LuaElement;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ErrorCode"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/boyaa/autotest/LuaElement$ErrorCode;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum CHANGE_NOT_SUPPORT:Lcom/boyaa/autotest/LuaElement$ErrorCode;

.field private static final synthetic ENUM$VALUES:[Lcom/boyaa/autotest/LuaElement$ErrorCode;

.field public static final enum GET_RESULT_EXECUTION_EXCEPTION:Lcom/boyaa/autotest/LuaElement$ErrorCode;

.field public static final enum GET_RESULT_INTERRUPTED_EXCEPTION:Lcom/boyaa/autotest/LuaElement$ErrorCode;

.field public static final enum GET_RESULT_UNKNOWN_EXCEPTION:Lcom/boyaa/autotest/LuaElement$ErrorCode;

.field public static final enum GET_VALUE_FAILED:Lcom/boyaa/autotest/LuaElement$ErrorCode;

.field public static final enum INVALID_ELEMENT_PROPERTY:Lcom/boyaa/autotest/LuaElement$ErrorCode;

.field public static final enum INVALID_ELEMENT_STATUS:Lcom/boyaa/autotest/LuaElement$ErrorCode;

.field public static final enum SUCCESS:Lcom/boyaa/autotest/LuaElement$ErrorCode;

.field public static final enum VALUE_NULL:Lcom/boyaa/autotest/LuaElement$ErrorCode;


# instance fields
.field private final statusCode:I

.field private final statusMessage:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .prologue
    const/16 v8, 0x8

    const/4 v7, 0x7

    const/4 v6, 0x6

    const/4 v5, 0x5

    const/4 v4, 0x0

    .line 16
    new-instance v0, Lcom/boyaa/autotest/LuaElement$ErrorCode;

    const-string v1, "SUCCESS"

    const-string v2, "The action executed successfully."

    invoke-direct {v0, v1, v4, v4, v2}, Lcom/boyaa/autotest/LuaElement$ErrorCode;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lcom/boyaa/autotest/LuaElement$ErrorCode;->SUCCESS:Lcom/boyaa/autotest/LuaElement$ErrorCode;

    .line 17
    new-instance v0, Lcom/boyaa/autotest/LuaElement$ErrorCode;

    const-string v1, "GET_RESULT_INTERRUPTED_EXCEPTION"

    const/4 v2, 0x1

    const-string v3, "Meet InterruptedException when acquire return cursor from LuaSetObj"

    invoke-direct {v0, v1, v2, v5, v3}, Lcom/boyaa/autotest/LuaElement$ErrorCode;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lcom/boyaa/autotest/LuaElement$ErrorCode;->GET_RESULT_INTERRUPTED_EXCEPTION:Lcom/boyaa/autotest/LuaElement$ErrorCode;

    .line 18
    new-instance v0, Lcom/boyaa/autotest/LuaElement$ErrorCode;

    const-string v1, "GET_RESULT_EXECUTION_EXCEPTION"

    const/4 v2, 0x2

    const-string v3, "Meet ExecutionException when acquire return cursor from LuaSetObj"

    invoke-direct {v0, v1, v2, v6, v3}, Lcom/boyaa/autotest/LuaElement$ErrorCode;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lcom/boyaa/autotest/LuaElement$ErrorCode;->GET_RESULT_EXECUTION_EXCEPTION:Lcom/boyaa/autotest/LuaElement$ErrorCode;

    .line 19
    new-instance v0, Lcom/boyaa/autotest/LuaElement$ErrorCode;

    const-string v1, "GET_RESULT_UNKNOWN_EXCEPTION"

    const/4 v2, 0x3

    const-string v3, "Meet unknown Exception when acquire return cursor from LuaSetObj"

    invoke-direct {v0, v1, v2, v7, v3}, Lcom/boyaa/autotest/LuaElement$ErrorCode;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lcom/boyaa/autotest/LuaElement$ErrorCode;->GET_RESULT_UNKNOWN_EXCEPTION:Lcom/boyaa/autotest/LuaElement$ErrorCode;

    .line 20
    new-instance v0, Lcom/boyaa/autotest/LuaElement$ErrorCode;

    const-string v1, "INVALID_ELEMENT_PROPERTY"

    const/4 v2, 0x4

    const-string v3, "The element doesn\'t have the property"

    invoke-direct {v0, v1, v2, v8, v3}, Lcom/boyaa/autotest/LuaElement$ErrorCode;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lcom/boyaa/autotest/LuaElement$ErrorCode;->INVALID_ELEMENT_PROPERTY:Lcom/boyaa/autotest/LuaElement$ErrorCode;

    .line 21
    new-instance v0, Lcom/boyaa/autotest/LuaElement$ErrorCode;

    const-string v1, "INVALID_ELEMENT_STATUS"

    const/16 v2, 0x9

    const-string v3, "The element is currently invalid since we can\'t get it by the drawing id"

    invoke-direct {v0, v1, v5, v2, v3}, Lcom/boyaa/autotest/LuaElement$ErrorCode;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lcom/boyaa/autotest/LuaElement$ErrorCode;->INVALID_ELEMENT_STATUS:Lcom/boyaa/autotest/LuaElement$ErrorCode;

    .line 22
    new-instance v0, Lcom/boyaa/autotest/LuaElement$ErrorCode;

    const-string v1, "GET_VALUE_FAILED"

    const/16 v2, 0xa

    const-string v3, "failed to get string value from jsonTable"

    invoke-direct {v0, v1, v6, v2, v3}, Lcom/boyaa/autotest/LuaElement$ErrorCode;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lcom/boyaa/autotest/LuaElement$ErrorCode;->GET_VALUE_FAILED:Lcom/boyaa/autotest/LuaElement$ErrorCode;

    .line 23
    new-instance v0, Lcom/boyaa/autotest/LuaElement$ErrorCode;

    const-string v1, "VALUE_NULL"

    const/16 v2, 0xb

    const-string v3, "The status and jsonTable when calling setDrawing function is nil"

    invoke-direct {v0, v1, v7, v2, v3}, Lcom/boyaa/autotest/LuaElement$ErrorCode;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lcom/boyaa/autotest/LuaElement$ErrorCode;->VALUE_NULL:Lcom/boyaa/autotest/LuaElement$ErrorCode;

    .line 24
    new-instance v0, Lcom/boyaa/autotest/LuaElement$ErrorCode;

    const-string v1, "CHANGE_NOT_SUPPORT"

    const/16 v2, 0xc

    const-string v3, "Change to this property is not support"

    invoke-direct {v0, v1, v8, v2, v3}, Lcom/boyaa/autotest/LuaElement$ErrorCode;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lcom/boyaa/autotest/LuaElement$ErrorCode;->CHANGE_NOT_SUPPORT:Lcom/boyaa/autotest/LuaElement$ErrorCode;

    .line 15
    const/16 v0, 0x9

    new-array v0, v0, [Lcom/boyaa/autotest/LuaElement$ErrorCode;

    sget-object v1, Lcom/boyaa/autotest/LuaElement$ErrorCode;->SUCCESS:Lcom/boyaa/autotest/LuaElement$ErrorCode;

    aput-object v1, v0, v4

    const/4 v1, 0x1

    sget-object v2, Lcom/boyaa/autotest/LuaElement$ErrorCode;->GET_RESULT_INTERRUPTED_EXCEPTION:Lcom/boyaa/autotest/LuaElement$ErrorCode;

    aput-object v2, v0, v1

    const/4 v1, 0x2

    sget-object v2, Lcom/boyaa/autotest/LuaElement$ErrorCode;->GET_RESULT_EXECUTION_EXCEPTION:Lcom/boyaa/autotest/LuaElement$ErrorCode;

    aput-object v2, v0, v1

    const/4 v1, 0x3

    sget-object v2, Lcom/boyaa/autotest/LuaElement$ErrorCode;->GET_RESULT_UNKNOWN_EXCEPTION:Lcom/boyaa/autotest/LuaElement$ErrorCode;

    aput-object v2, v0, v1

    const/4 v1, 0x4

    sget-object v2, Lcom/boyaa/autotest/LuaElement$ErrorCode;->INVALID_ELEMENT_PROPERTY:Lcom/boyaa/autotest/LuaElement$ErrorCode;

    aput-object v2, v0, v1

    sget-object v1, Lcom/boyaa/autotest/LuaElement$ErrorCode;->INVALID_ELEMENT_STATUS:Lcom/boyaa/autotest/LuaElement$ErrorCode;

    aput-object v1, v0, v5

    sget-object v1, Lcom/boyaa/autotest/LuaElement$ErrorCode;->GET_VALUE_FAILED:Lcom/boyaa/autotest/LuaElement$ErrorCode;

    aput-object v1, v0, v6

    sget-object v1, Lcom/boyaa/autotest/LuaElement$ErrorCode;->VALUE_NULL:Lcom/boyaa/autotest/LuaElement$ErrorCode;

    aput-object v1, v0, v7

    sget-object v1, Lcom/boyaa/autotest/LuaElement$ErrorCode;->CHANGE_NOT_SUPPORT:Lcom/boyaa/autotest/LuaElement$ErrorCode;

    aput-object v1, v0, v8

    sput-object v0, Lcom/boyaa/autotest/LuaElement$ErrorCode;->ENUM$VALUES:[Lcom/boyaa/autotest/LuaElement$ErrorCode;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 1
    .param p3, "code"    # I

    .prologue
    .line 29
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 30
    iput p3, p0, Lcom/boyaa/autotest/LuaElement$ErrorCode;->statusCode:I

    .line 31
    const-string v0, ""

    iput-object v0, p0, Lcom/boyaa/autotest/LuaElement$ErrorCode;->statusMessage:Ljava/lang/String;

    .line 32
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IILjava/lang/String;)V
    .locals 0
    .param p3, "code"    # I
    .param p4, "message"    # Ljava/lang/String;

    .prologue
    .line 34
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 35
    iput p3, p0, Lcom/boyaa/autotest/LuaElement$ErrorCode;->statusCode:I

    .line 36
    iput-object p4, p0, Lcom/boyaa/autotest/LuaElement$ErrorCode;->statusMessage:Ljava/lang/String;

    .line 37
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/boyaa/autotest/LuaElement$ErrorCode;
    .locals 1

    .prologue
    .line 1
    const-class v0, Lcom/boyaa/autotest/LuaElement$ErrorCode;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/boyaa/autotest/LuaElement$ErrorCode;

    return-object v0
.end method

.method public static values()[Lcom/boyaa/autotest/LuaElement$ErrorCode;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lcom/boyaa/autotest/LuaElement$ErrorCode;->ENUM$VALUES:[Lcom/boyaa/autotest/LuaElement$ErrorCode;

    array-length v1, v0

    new-array v2, v1, [Lcom/boyaa/autotest/LuaElement$ErrorCode;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method


# virtual methods
.method public code()I
    .locals 1

    .prologue
    .line 40
    iget v0, p0, Lcom/boyaa/autotest/LuaElement$ErrorCode;->statusCode:I

    return v0
.end method

.method public message()Ljava/lang/String;
    .locals 1

    .prologue
    .line 44
    iget-object v0, p0, Lcom/boyaa/autotest/LuaElement$ErrorCode;->statusMessage:Ljava/lang/String;

    return-object v0
.end method
