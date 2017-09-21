.class Lcom/boyaa/engine/made/AppActivity$AppHandler;
.super Landroid/os/Handler;
.source "AppActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/boyaa/engine/made/AppActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "AppHandler"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 239
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/boyaa/engine/made/AppActivity$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/boyaa/engine/made/AppActivity$1;

    .prologue
    .line 239
    invoke-direct {p0}, Lcom/boyaa/engine/made/AppActivity$AppHandler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 4
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 242
    # getter for: Lcom/boyaa/engine/made/AppActivity;->mSyncMsgIds:Ljava/lang/Object;
    invoke-static {}, Lcom/boyaa/engine/made/AppActivity;->access$200()Ljava/lang/Object;

    move-result-object v2

    monitor-enter v2

    .line 243
    :try_start_0
    # getter for: Lcom/boyaa/engine/made/AppActivity;->mTimeoutMsgIds:Ljava/util/HashMap;
    invoke-static {}, Lcom/boyaa/engine/made/AppActivity;->access$300()Ljava/util/HashMap;

    move-result-object v1

    iget v3, p1, Landroid/os/Message;->what:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 244
    iget v0, p1, Landroid/os/Message;->what:I

    .line 245
    .local v0, "id":I
    # getter for: Lcom/boyaa/engine/made/AppActivity;->mTimeoutMsgIds:Ljava/util/HashMap;
    invoke-static {}, Lcom/boyaa/engine/made/AppActivity;->access$300()Ljava/util/HashMap;

    move-result-object v1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 246
    invoke-static {}, Lcom/boyaa/engine/made/AppActivity;->getInstance()Lcom/boyaa/engine/made/AppActivity;

    move-result-object v1

    new-instance v3, Lcom/boyaa/engine/made/AppActivity$AppHandler$1;

    invoke-direct {v3, p0, v0}, Lcom/boyaa/engine/made/AppActivity$AppHandler$1;-><init>(Lcom/boyaa/engine/made/AppActivity$AppHandler;I)V

    invoke-virtual {v1, v3}, Lcom/boyaa/engine/made/AppActivity;->runOnLuaThread(Ljava/lang/Runnable;)V

    .line 254
    .end local v0    # "id":I
    :cond_0
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 255
    iget v1, p1, Landroid/os/Message;->what:I

    packed-switch v1, :pswitch_data_0

    .line 262
    :goto_0
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 263
    return-void

    .line 254
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1

    .line 258
    :pswitch_0
    invoke-static {p1}, Lcom/boyaa/engine/made/AppHttpPost;->HandleTimeout(Landroid/os/Message;)V

    goto :goto_0

    .line 255
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method
