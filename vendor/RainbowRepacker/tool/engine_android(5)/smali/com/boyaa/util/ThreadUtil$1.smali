.class Lcom/boyaa/util/ThreadUtil$1;
.super Lcom/boyaa/app/common/OnThreadTask;
.source "ThreadUtil.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/util/ThreadUtil;->doPreloadSound(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/util/ThreadUtil;

.field private final synthetic val$soundPath:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/boyaa/util/ThreadUtil;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/util/ThreadUtil$1;->this$0:Lcom/boyaa/util/ThreadUtil;

    iput-object p2, p0, Lcom/boyaa/util/ThreadUtil$1;->val$soundPath:Ljava/lang/String;

    .line 32
    invoke-direct {p0}, Lcom/boyaa/app/common/OnThreadTask;-><init>()V

    return-void
.end method


# virtual methods
.method public onAfterUIRun()V
    .locals 2

    .prologue
    .line 63
    sget-object v0, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    new-instance v1, Lcom/boyaa/util/ThreadUtil$1$1;

    invoke-direct {v1, p0}, Lcom/boyaa/util/ThreadUtil$1$1;-><init>(Lcom/boyaa/util/ThreadUtil$1;)V

    invoke-virtual {v0, v1}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->runOnLuaThread(Ljava/lang/Runnable;)V

    .line 72
    invoke-static {}, Lcom/boyaa/enginedlqp/maindevelop/Game;->getGameHandler()Landroid/os/Handler;

    move-result-object v0

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 73
    return-void
.end method

.method public onThreadRun()V
    .locals 9

    .prologue
    .line 35
    const/4 v4, 0x0

    .line 37
    .local v4, "jsonResult":Lorg/json/JSONObject;
    :try_start_0
    new-instance v5, Lorg/json/JSONObject;

    iget-object v8, p0, Lcom/boyaa/util/ThreadUtil$1;->val$soundPath:Ljava/lang/String;

    invoke-direct {v5, v8}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 38
    .end local v4    # "jsonResult":Lorg/json/JSONObject;
    .local v5, "jsonResult":Lorg/json/JSONObject;
    :try_start_1
    const-string v8, "music"

    invoke-virtual {v5, v8}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v6

    .line 39
    .local v6, "musicArr":Lorg/json/JSONArray;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    invoke-virtual {v6}, Lorg/json/JSONArray;->length()I

    move-result v8

    if-lt v3, v8, :cond_0

    .line 45
    const-string v8, "effect"

    invoke-virtual {v5, v8}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    .line 46
    .local v1, "effectArr":Lorg/json/JSONArray;
    const/4 v3, 0x0

    :goto_1
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v8

    if-lt v3, v8, :cond_2

    move-object v4, v5

    .line 56
    .end local v1    # "effectArr":Lorg/json/JSONArray;
    .end local v3    # "i":I
    .end local v5    # "jsonResult":Lorg/json/JSONObject;
    .end local v6    # "musicArr":Lorg/json/JSONArray;
    .restart local v4    # "jsonResult":Lorg/json/JSONObject;
    :goto_2
    return-void

    .line 40
    .end local v4    # "jsonResult":Lorg/json/JSONObject;
    .restart local v3    # "i":I
    .restart local v5    # "jsonResult":Lorg/json/JSONObject;
    .restart local v6    # "musicArr":Lorg/json/JSONArray;
    :cond_0
    invoke-virtual {v6, v3}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v7

    .line 41
    .local v7, "musicPath":Ljava/lang/String;
    const-string v8, "null"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_1

    .line 42
    invoke-static {v7}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->preloadBackgroundMusic(Ljava/lang/String;)V

    .line 39
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 47
    .end local v7    # "musicPath":Ljava/lang/String;
    .restart local v1    # "effectArr":Lorg/json/JSONArray;
    :cond_2
    invoke-virtual {v1, v3}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 48
    .local v2, "effectPath":Ljava/lang/String;
    const-string v8, "null"

    invoke-virtual {v2, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_3

    .line 49
    invoke-static {v2}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->preloadEffect(Ljava/lang/String;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    .line 46
    :cond_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 52
    .end local v1    # "effectArr":Lorg/json/JSONArray;
    .end local v2    # "effectPath":Ljava/lang/String;
    .end local v3    # "i":I
    .end local v5    # "jsonResult":Lorg/json/JSONObject;
    .end local v6    # "musicArr":Lorg/json/JSONArray;
    .restart local v4    # "jsonResult":Lorg/json/JSONObject;
    :catch_0
    move-exception v0

    .line 53
    .local v0, "e":Lorg/json/JSONException;
    :goto_3
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_2

    .line 52
    .end local v0    # "e":Lorg/json/JSONException;
    .end local v4    # "jsonResult":Lorg/json/JSONObject;
    .restart local v5    # "jsonResult":Lorg/json/JSONObject;
    :catch_1
    move-exception v0

    move-object v4, v5

    .end local v5    # "jsonResult":Lorg/json/JSONObject;
    .restart local v4    # "jsonResult":Lorg/json/JSONObject;
    goto :goto_3
.end method

.method public onUIBackPressed()V
    .locals 0

    .prologue
    .line 78
    return-void
.end method
