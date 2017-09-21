.class Lcom/boyaa/app/download/DownloadHandler$1;
.super Landroid/content/BroadcastReceiver;
.source "DownloadHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/boyaa/app/download/DownloadHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/app/download/DownloadHandler;


# direct methods
.method constructor <init>(Lcom/boyaa/app/download/DownloadHandler;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/app/download/DownloadHandler$1;->this$0:Lcom/boyaa/app/download/DownloadHandler;

    .line 31
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 10
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;
    .annotation build Landroid/annotation/TargetApi;
        value = 0x9
    .end annotation

    .prologue
    const-wide/16 v8, 0x0

    .line 37
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 38
    .local v0, "action":Ljava/lang/String;
    const-string v4, "android.intent.action.DOWNLOAD_COMPLETE"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 39
    const-string v4, "extra_download_id"

    invoke-virtual {p2, v4, v8, v9}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v1

    .line 40
    .local v1, "dlid":J
    iget-object v5, p0, Lcom/boyaa/app/download/DownloadHandler$1;->this$0:Lcom/boyaa/app/download/DownloadHandler;

    iget-object v4, p0, Lcom/boyaa/app/download/DownloadHandler$1;->this$0:Lcom/boyaa/app/download/DownloadHandler;

    # getter for: Lcom/boyaa/app/download/DownloadHandler;->mDownloadCache:Ljava/util/HashMap;
    invoke-static {v4}, Lcom/boyaa/app/download/DownloadHandler;->access$0(Lcom/boyaa/app/download/DownloadHandler;)Ljava/util/HashMap;

    move-result-object v4

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/boyaa/app/download/DownloadHandler$DownloadItem;

    # invokes: Lcom/boyaa/app/download/DownloadHandler;->parseDownloadByItem(Lcom/boyaa/app/download/DownloadHandler$DownloadItem;)Lcom/boyaa/app/download/DownloadHandler$DownloadItem;
    invoke-static {v5, v4}, Lcom/boyaa/app/download/DownloadHandler;->access$1(Lcom/boyaa/app/download/DownloadHandler;Lcom/boyaa/app/download/DownloadHandler$DownloadItem;)Lcom/boyaa/app/download/DownloadHandler$DownloadItem;

    move-result-object v3

    .line 41
    .local v3, "item":Lcom/boyaa/app/download/DownloadHandler$DownloadItem;
    iget-object v4, p0, Lcom/boyaa/app/download/DownloadHandler$1;->this$0:Lcom/boyaa/app/download/DownloadHandler;

    # getter for: Lcom/boyaa/app/download/DownloadHandler;->mCompleteListener:Lcom/boyaa/app/download/DownloadHandler$OnCompleteListener;
    invoke-static {v4}, Lcom/boyaa/app/download/DownloadHandler;->access$2(Lcom/boyaa/app/download/DownloadHandler;)Lcom/boyaa/app/download/DownloadHandler$OnCompleteListener;

    move-result-object v4

    if-eqz v4, :cond_3

    .line 42
    iget-object v4, p0, Lcom/boyaa/app/download/DownloadHandler$1;->this$0:Lcom/boyaa/app/download/DownloadHandler;

    # getter for: Lcom/boyaa/app/download/DownloadHandler;->mCompleteListener:Lcom/boyaa/app/download/DownloadHandler$OnCompleteListener;
    invoke-static {v4}, Lcom/boyaa/app/download/DownloadHandler;->access$2(Lcom/boyaa/app/download/DownloadHandler;)Lcom/boyaa/app/download/DownloadHandler$OnCompleteListener;

    move-result-object v4

    iget-object v5, v3, Lcom/boyaa/app/download/DownloadHandler$DownloadItem;->url:Ljava/lang/String;

    iget-object v6, v3, Lcom/boyaa/app/download/DownloadHandler$DownloadItem;->path:Ljava/lang/String;

    invoke-interface {v4, v5, v6}, Lcom/boyaa/app/download/DownloadHandler$OnCompleteListener;->onComplete(Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    .end local v1    # "dlid":J
    .end local v3    # "item":Lcom/boyaa/app/download/DownloadHandler$DownloadItem;
    :cond_0
    :goto_0
    const-string v4, "android.intent.action.DOWNLOAD_NOTIFICATION_CLICKED"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 48
    const-string v4, "wanpg"

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "ACTION_NOTIFICATION_CLICKED:"

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v6, "extra_download_id"

    invoke-virtual {p2, v6, v8, v9}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v6

    invoke-virtual {v5, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/boyaa/app/debug/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 50
    :cond_1
    const-string v4, "android.intent.action.VIEW_DOWNLOADS"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 51
    const-string v4, "wanpg"

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "ACTION_VIEW_DOWNLOADS:"

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v6, "extra_download_id"

    invoke-virtual {p2, v6, v8, v9}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v6

    invoke-virtual {v5, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/boyaa/app/debug/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    :cond_2
    return-void

    .line 44
    .restart local v1    # "dlid":J
    .restart local v3    # "item":Lcom/boyaa/app/download/DownloadHandler$DownloadItem;
    :cond_3
    iget-object v4, p0, Lcom/boyaa/app/download/DownloadHandler$1;->this$0:Lcom/boyaa/app/download/DownloadHandler;

    iget-object v5, p0, Lcom/boyaa/app/download/DownloadHandler$1;->this$0:Lcom/boyaa/app/download/DownloadHandler;

    # getter for: Lcom/boyaa/app/download/DownloadHandler;->mContext:Landroid/content/Context;
    invoke-static {v5}, Lcom/boyaa/app/download/DownloadHandler;->access$3(Lcom/boyaa/app/download/DownloadHandler;)Landroid/content/Context;

    move-result-object v5

    iget-object v6, v3, Lcom/boyaa/app/download/DownloadHandler$DownloadItem;->path:Ljava/lang/String;

    iget-object v7, v3, Lcom/boyaa/app/download/DownloadHandler$DownloadItem;->type:Ljava/lang/String;

    invoke-virtual {v4, v5, v6, v7}, Lcom/boyaa/app/download/DownloadHandler;->installApplication(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    goto :goto_0
.end method
