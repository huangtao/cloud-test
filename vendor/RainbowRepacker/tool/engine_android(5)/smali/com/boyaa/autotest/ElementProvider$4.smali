.class Lcom/boyaa/autotest/ElementProvider$4;
.super Ljava/lang/Object;
.source "ElementProvider.java"

# interfaces
.implements Lcom/boyaa/engine/made/CallLuaHelper$onCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/autotest/ElementProvider;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/autotest/ElementProvider;


# direct methods
.method constructor <init>(Lcom/boyaa/autotest/ElementProvider;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/autotest/ElementProvider$4;->this$0:Lcom/boyaa/autotest/ElementProvider;

    .line 164
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public callback()V
    .locals 7

    .prologue
    const/4 v6, 0x1

    .line 166
    const-string v3, "testsupport"

    const-string v4, "start call"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 169
    :try_start_0
    const-string v3, "Elements"

    const-string v4, "setElementText"

    invoke-static {v3, v4}, Lcom/boyaa/engine/made/GhostLib;->dictGetString(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v2

    .line 170
    .local v2, "result1":[B
    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/lang/String;-><init>([B)V

    .line 171
    .local v1, "result":Ljava/lang/String;
    const-string v3, "testsupport"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "returnInt:"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 172
    invoke-virtual {v1}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "true"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 173
    const-string v3, "testsupport"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "returnInt0:"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 174
    iget-object v3, p0, Lcom/boyaa/autotest/ElementProvider$4;->this$0:Lcom/boyaa/autotest/ElementProvider;

    const/4 v4, 0x0

    iput v4, v3, Lcom/boyaa/autotest/ElementProvider;->returnInt:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 182
    .end local v1    # "result":Ljava/lang/String;
    .end local v2    # "result1":[B
    :goto_0
    iget-object v3, p0, Lcom/boyaa/autotest/ElementProvider$4;->this$0:Lcom/boyaa/autotest/ElementProvider;

    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/boyaa/autotest/ElementProvider;->access$0(Lcom/boyaa/autotest/ElementProvider;Ljava/lang/Boolean;)V

    .line 183
    return-void

    .line 176
    .restart local v1    # "result":Ljava/lang/String;
    .restart local v2    # "result1":[B
    :cond_0
    :try_start_1
    iget-object v3, p0, Lcom/boyaa/autotest/ElementProvider$4;->this$0:Lcom/boyaa/autotest/ElementProvider;

    const/4 v4, 0x1

    iput v4, v3, Lcom/boyaa/autotest/ElementProvider;->returnInt:I

    .line 177
    const-string v3, "testsupport"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "returnInt1:"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 179
    .end local v1    # "result":Ljava/lang/String;
    .end local v2    # "result1":[B
    :catch_0
    move-exception v0

    .line 180
    .local v0, "e":Ljava/lang/Exception;
    const-string v3, "testsupport"

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method
