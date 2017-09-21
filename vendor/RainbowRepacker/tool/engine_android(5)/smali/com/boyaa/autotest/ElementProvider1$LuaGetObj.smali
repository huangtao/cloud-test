.class Lcom/boyaa/autotest/ElementProvider1$LuaGetObj;
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
    name = "LuaGetObj"
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
    .locals 2
    .param p2, "selection"    # Ljava/lang/String;

    .prologue
    .line 230
    iput-object p1, p0, Lcom/boyaa/autotest/ElementProvider1$LuaGetObj;->this$0:Lcom/boyaa/autotest/ElementProvider1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 231
    iput-object p2, p0, Lcom/boyaa/autotest/ElementProvider1$LuaGetObj;->selection:Ljava/lang/String;

    .line 232
    const/4 v1, 0x0

    new-array v0, v1, [Ljava/lang/String;

    .line 233
    .local v0, "tableCursor":[Ljava/lang/String;
    new-instance v1, Landroid/database/MatrixCursor;

    invoke-direct {v1, v0}, Landroid/database/MatrixCursor;-><init>([Ljava/lang/String;)V

    iput-object v1, p0, Lcom/boyaa/autotest/ElementProvider1$LuaGetObj;->cursor:Landroid/database/MatrixCursor;

    .line 234
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
    .line 238
    const-string v4, "testsupport"

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "selection in LuaGetObj function:"

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v6, p0, Lcom/boyaa/autotest/ElementProvider1$LuaGetObj;->selection:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 240
    new-instance v2, Lorg/json/JSONObject;

    iget-object v4, p0, Lcom/boyaa/autotest/ElementProvider1$LuaGetObj;->selection:Ljava/lang/String;

    invoke-direct {v2, v4}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 241
    .local v2, "jsonObject2":Lorg/json/JSONObject;
    const-string v4, "xpath"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 242
    const-string v4, "getNodesByXPath"

    iget-object v5, p0, Lcom/boyaa/autotest/ElementProvider1$LuaGetObj;->selection:Ljava/lang/String;

    invoke-static {v4, v5}, Lcom/boyaa/engine/made/GhostLib;->callLuaWithArgs(Ljava/lang/String;Ljava/lang/String;)I

    .line 243
    const-string v4, "Elements"

    const-string v5, "getNodesByXPath"

    invoke-static {v4, v5}, Lcom/boyaa/engine/made/GhostLib;->dictGetString(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v1

    .line 248
    .local v1, "elementsInfo1":[B
    :goto_0
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>([B)V

    .line 249
    .local v0, "elementsInfo":Ljava/lang/String;
    const/4 v4, 0x1

    new-array v3, v4, [Ljava/lang/String;

    const/4 v4, 0x0

    aput-object v0, v3, v4

    .line 250
    .local v3, "tableCursor1":[Ljava/lang/String;
    iget-object v4, p0, Lcom/boyaa/autotest/ElementProvider1$LuaGetObj;->this$0:Lcom/boyaa/autotest/ElementProvider1;

    new-instance v5, Landroid/database/MatrixCursor;

    invoke-direct {v5, v3}, Landroid/database/MatrixCursor;-><init>([Ljava/lang/String;)V

    iput-object v5, v4, Lcom/boyaa/autotest/ElementProvider1;->returnCursor:Landroid/database/MatrixCursor;

    .line 251
    iget-object v4, p0, Lcom/boyaa/autotest/ElementProvider1$LuaGetObj;->this$0:Lcom/boyaa/autotest/ElementProvider1;

    iget-object v4, v4, Lcom/boyaa/autotest/ElementProvider1;->returnCursor:Landroid/database/MatrixCursor;

    return-object v4

    .line 245
    .end local v0    # "elementsInfo":Ljava/lang/String;
    .end local v1    # "elementsInfo1":[B
    .end local v3    # "tableCursor1":[Ljava/lang/String;
    :cond_0
    const-string v4, "getElements"

    iget-object v5, p0, Lcom/boyaa/autotest/ElementProvider1$LuaGetObj;->selection:Ljava/lang/String;

    invoke-static {v4, v5}, Lcom/boyaa/engine/made/GhostLib;->callLuaWithArgs(Ljava/lang/String;Ljava/lang/String;)I

    .line 246
    const-string v4, "Elements"

    const-string v5, "getElements"

    invoke-static {v4, v5}, Lcom/boyaa/engine/made/GhostLib;->dictGetString(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v1

    .restart local v1    # "elementsInfo1":[B
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
    invoke-virtual {p0}, Lcom/boyaa/autotest/ElementProvider1$LuaGetObj;->call()Landroid/database/MatrixCursor;

    move-result-object v0

    return-object v0
.end method
