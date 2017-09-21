.class Lcom/boyaa/autotest/ElementProvider1$LuaGetObj1;
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
    name = "LuaGetObj1"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable",
        "<",
        "Landroid/database/MatrixCursor;",
        ">;"
    }
.end annotation


# static fields
.field private static final RetDict:Ljava/lang/String; = "ret_dict"


# instance fields
.field private cursor:Landroid/database/MatrixCursor;

.field private selection:Ljava/lang/String;

.field final synthetic this$0:Lcom/boyaa/autotest/ElementProvider1;


# direct methods
.method public constructor <init>(Lcom/boyaa/autotest/ElementProvider1;Ljava/lang/String;)V
    .locals 4
    .param p2, "selection"    # Ljava/lang/String;

    .prologue
    .line 259
    iput-object p1, p0, Lcom/boyaa/autotest/ElementProvider1$LuaGetObj1;->this$0:Lcom/boyaa/autotest/ElementProvider1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 260
    iput-object p2, p0, Lcom/boyaa/autotest/ElementProvider1$LuaGetObj1;->selection:Ljava/lang/String;

    .line 261
    const/4 v1, 0x0

    new-array v0, v1, [Ljava/lang/String;

    .line 262
    .local v0, "tableCursor":[Ljava/lang/String;
    new-instance v1, Landroid/database/MatrixCursor;

    invoke-direct {v1, v0}, Landroid/database/MatrixCursor;-><init>([Ljava/lang/String;)V

    iput-object v1, p0, Lcom/boyaa/autotest/ElementProvider1$LuaGetObj1;->cursor:Landroid/database/MatrixCursor;

    .line 263
    const-string v1, "testsupport"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "22222:"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, p0, Lcom/boyaa/autotest/ElementProvider1$LuaGetObj1;->cursor:Landroid/database/MatrixCursor;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 264
    return-void
.end method


# virtual methods
.method public call()Landroid/database/MatrixCursor;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 267
    const-string v4, "testsupport"

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "selection in LuaGetObj function:"

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v6, p0, Lcom/boyaa/autotest/ElementProvider1$LuaGetObj1;->selection:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 268
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 269
    .local v0, "jsonObject":Lorg/json/JSONObject;
    const-string v4, "getHierarchy"

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/boyaa/engine/made/GhostLib;->callLuaWithArgs(Ljava/lang/String;Ljava/lang/String;)I

    .line 270
    const-string v4, "testsupport"

    const-string v5, "00000000000000"

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 271
    const-string v4, "Elements"

    const-string v5, "getHierarchy"

    invoke-static {v4, v5}, Lcom/boyaa/engine/made/GhostLib;->dictGetString(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v2

    .line 272
    .local v2, "result1":[B
    if-nez v2, :cond_0

    .line 273
    const-string v4, "testsupport"

    const-string v5, "1111111111111111111111"

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 283
    :goto_0
    iget-object v4, p0, Lcom/boyaa/autotest/ElementProvider1$LuaGetObj1;->this$0:Lcom/boyaa/autotest/ElementProvider1;

    iget-object v4, v4, Lcom/boyaa/autotest/ElementProvider1;->returnCursor:Landroid/database/MatrixCursor;

    return-object v4

    .line 276
    :cond_0
    const-string v4, "testsupport"

    const-string v5, "2222222222222222222222"

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 277
    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/lang/String;-><init>([B)V

    .line 278
    .local v1, "result":Ljava/lang/String;
    const-string v4, "testsupport"

    invoke-static {v4, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 280
    const/4 v4, 0x1

    new-array v3, v4, [Ljava/lang/String;

    const/4 v4, 0x0

    aput-object v1, v3, v4

    .line 281
    .local v3, "tableCursor1":[Ljava/lang/String;
    iget-object v4, p0, Lcom/boyaa/autotest/ElementProvider1$LuaGetObj1;->this$0:Lcom/boyaa/autotest/ElementProvider1;

    new-instance v5, Landroid/database/MatrixCursor;

    invoke-direct {v5, v3}, Landroid/database/MatrixCursor;-><init>([Ljava/lang/String;)V

    iput-object v5, v4, Lcom/boyaa/autotest/ElementProvider1;->returnCursor:Landroid/database/MatrixCursor;

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
    invoke-virtual {p0}, Lcom/boyaa/autotest/ElementProvider1$LuaGetObj1;->call()Landroid/database/MatrixCursor;

    move-result-object v0

    return-object v0
.end method
