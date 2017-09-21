.class Lcom/boyaa/autotest/ElementProvider1$LuaSetObj;
.super Ljava/lang/Object;
.source "ElementProvider1.java"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/boyaa/autotest/ElementProvider1;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "LuaSetObj"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable",
        "<",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# static fields
.field private static final LuaInfo:Ljava/lang/String; = "lua_info"

.field private static final RetDict:Ljava/lang/String; = "ret_dict"


# instance fields
.field private selection:Ljava/lang/String;

.field final synthetic this$0:Lcom/boyaa/autotest/ElementProvider1;


# direct methods
.method public constructor <init>(Lcom/boyaa/autotest/ElementProvider1;Ljava/lang/String;)V
    .locals 0
    .param p2, "selection"    # Ljava/lang/String;

    .prologue
    .line 294
    iput-object p1, p0, Lcom/boyaa/autotest/ElementProvider1$LuaSetObj;->this$0:Lcom/boyaa/autotest/ElementProvider1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 295
    iput-object p2, p0, Lcom/boyaa/autotest/ElementProvider1$LuaSetObj;->selection:Ljava/lang/String;

    .line 296
    return-void
.end method


# virtual methods
.method public call()Ljava/lang/Integer;
    .locals 4

    .prologue
    .line 300
    const-string v1, "testsupport"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "selection in LuaSetObj function:"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, p0, Lcom/boyaa/autotest/ElementProvider1$LuaSetObj;->selection:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 301
    const-string v0, "AAA"

    .line 302
    .local v0, "luaInfo":Ljava/lang/String;
    const-string v1, "testsupport"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "lua_info:"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 303
    sget-object v1, Lcom/boyaa/autotest/LuaElement$ErrorCode;->GET_VALUE_FAILED:Lcom/boyaa/autotest/LuaElement$ErrorCode;

    invoke-virtual {v1}, Lcom/boyaa/autotest/LuaElement$ErrorCode;->message()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 304
    sget-object v1, Lcom/boyaa/autotest/LuaElement$ErrorCode;->GET_VALUE_FAILED:Lcom/boyaa/autotest/LuaElement$ErrorCode;

    invoke-virtual {v1}, Lcom/boyaa/autotest/LuaElement$ErrorCode;->code()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 312
    :goto_0
    return-object v1

    .line 305
    :cond_0
    sget-object v1, Lcom/boyaa/autotest/LuaElement$ErrorCode;->INVALID_ELEMENT_PROPERTY:Lcom/boyaa/autotest/LuaElement$ErrorCode;

    invoke-virtual {v1}, Lcom/boyaa/autotest/LuaElement$ErrorCode;->message()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 306
    sget-object v1, Lcom/boyaa/autotest/LuaElement$ErrorCode;->INVALID_ELEMENT_PROPERTY:Lcom/boyaa/autotest/LuaElement$ErrorCode;

    invoke-virtual {v1}, Lcom/boyaa/autotest/LuaElement$ErrorCode;->code()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    goto :goto_0

    .line 307
    :cond_1
    sget-object v1, Lcom/boyaa/autotest/LuaElement$ErrorCode;->INVALID_ELEMENT_STATUS:Lcom/boyaa/autotest/LuaElement$ErrorCode;

    invoke-virtual {v1}, Lcom/boyaa/autotest/LuaElement$ErrorCode;->message()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 308
    sget-object v1, Lcom/boyaa/autotest/LuaElement$ErrorCode;->INVALID_ELEMENT_STATUS:Lcom/boyaa/autotest/LuaElement$ErrorCode;

    invoke-virtual {v1}, Lcom/boyaa/autotest/LuaElement$ErrorCode;->code()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    goto :goto_0

    .line 309
    :cond_2
    sget-object v1, Lcom/boyaa/autotest/LuaElement$ErrorCode;->VALUE_NULL:Lcom/boyaa/autotest/LuaElement$ErrorCode;

    invoke-virtual {v1}, Lcom/boyaa/autotest/LuaElement$ErrorCode;->message()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 310
    sget-object v1, Lcom/boyaa/autotest/LuaElement$ErrorCode;->VALUE_NULL:Lcom/boyaa/autotest/LuaElement$ErrorCode;

    invoke-virtual {v1}, Lcom/boyaa/autotest/LuaElement$ErrorCode;->code()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    goto :goto_0

    .line 312
    :cond_3
    sget-object v1, Lcom/boyaa/autotest/LuaElement$ErrorCode;->SUCCESS:Lcom/boyaa/autotest/LuaElement$ErrorCode;

    invoke-virtual {v1}, Lcom/boyaa/autotest/LuaElement$ErrorCode;->code()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    goto :goto_0
.end method

.method public bridge synthetic call()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/boyaa/autotest/ElementProvider1$LuaSetObj;->call()Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method
