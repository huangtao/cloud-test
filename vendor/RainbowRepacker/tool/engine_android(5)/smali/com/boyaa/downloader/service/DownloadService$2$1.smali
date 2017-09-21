.class Lcom/boyaa/downloader/service/DownloadService$2$1;
.super Ljava/lang/Object;
.source "DownloadService.java"

# interfaces
.implements Lcom/boyaa/downloader/network/DownloadProgressListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/downloader/service/DownloadService$2;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/boyaa/downloader/service/DownloadService$2;


# direct methods
.method constructor <init>(Lcom/boyaa/downloader/service/DownloadService$2;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/downloader/service/DownloadService$2$1;->this$1:Lcom/boyaa/downloader/service/DownloadService$2;

    .line 187
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDownloadSize(I)V
    .locals 8
    .param p1, "size"    # I

    .prologue
    const/4 v7, 0x0

    .line 191
    iget-object v3, p0, Lcom/boyaa/downloader/service/DownloadService$2$1;->this$1:Lcom/boyaa/downloader/service/DownloadService$2;

    # getter for: Lcom/boyaa/downloader/service/DownloadService$2;->this$0:Lcom/boyaa/downloader/service/DownloadService;
    invoke-static {v3}, Lcom/boyaa/downloader/service/DownloadService$2;->access$0(Lcom/boyaa/downloader/service/DownloadService$2;)Lcom/boyaa/downloader/service/DownloadService;

    move-result-object v3

    # getter for: Lcom/boyaa/downloader/service/DownloadService;->mUpdateNotifcation:Landroid/app/Notification;
    invoke-static {v3}, Lcom/boyaa/downloader/service/DownloadService;->access$5(Lcom/boyaa/downloader/service/DownloadService;)Landroid/app/Notification;

    move-result-object v3

    if-nez v3, :cond_0

    .line 192
    iget-object v3, p0, Lcom/boyaa/downloader/service/DownloadService$2$1;->this$1:Lcom/boyaa/downloader/service/DownloadService$2;

    # getter for: Lcom/boyaa/downloader/service/DownloadService$2;->this$0:Lcom/boyaa/downloader/service/DownloadService;
    invoke-static {v3}, Lcom/boyaa/downloader/service/DownloadService$2;->access$0(Lcom/boyaa/downloader/service/DownloadService$2;)Lcom/boyaa/downloader/service/DownloadService;

    move-result-object v3

    new-instance v4, Landroid/app/Notification;

    invoke-direct {v4}, Landroid/app/Notification;-><init>()V

    invoke-static {v3, v4}, Lcom/boyaa/downloader/service/DownloadService;->access$6(Lcom/boyaa/downloader/service/DownloadService;Landroid/app/Notification;)V

    .line 193
    iget-object v3, p0, Lcom/boyaa/downloader/service/DownloadService$2$1;->this$1:Lcom/boyaa/downloader/service/DownloadService$2;

    # getter for: Lcom/boyaa/downloader/service/DownloadService$2;->this$0:Lcom/boyaa/downloader/service/DownloadService;
    invoke-static {v3}, Lcom/boyaa/downloader/service/DownloadService$2;->access$0(Lcom/boyaa/downloader/service/DownloadService$2;)Lcom/boyaa/downloader/service/DownloadService;

    move-result-object v3

    # getter for: Lcom/boyaa/downloader/service/DownloadService;->mUpdateNotifcation:Landroid/app/Notification;
    invoke-static {v3}, Lcom/boyaa/downloader/service/DownloadService;->access$5(Lcom/boyaa/downloader/service/DownloadService;)Landroid/app/Notification;

    move-result-object v3

    const v4, 0x7f02000f

    iput v4, v3, Landroid/app/Notification;->icon:I

    .line 194
    iget-object v3, p0, Lcom/boyaa/downloader/service/DownloadService$2$1;->this$1:Lcom/boyaa/downloader/service/DownloadService$2;

    # getter for: Lcom/boyaa/downloader/service/DownloadService$2;->this$0:Lcom/boyaa/downloader/service/DownloadService;
    invoke-static {v3}, Lcom/boyaa/downloader/service/DownloadService$2;->access$0(Lcom/boyaa/downloader/service/DownloadService$2;)Lcom/boyaa/downloader/service/DownloadService;

    move-result-object v3

    # getter for: Lcom/boyaa/downloader/service/DownloadService;->mUpdateNotifcation:Landroid/app/Notification;
    invoke-static {v3}, Lcom/boyaa/downloader/service/DownloadService;->access$5(Lcom/boyaa/downloader/service/DownloadService;)Landroid/app/Notification;

    move-result-object v3

    const-string v4, "2131165187\u4e0b\u8f7d\u4e2d"

    iput-object v4, v3, Landroid/app/Notification;->tickerText:Ljava/lang/CharSequence;

    .line 195
    iget-object v3, p0, Lcom/boyaa/downloader/service/DownloadService$2$1;->this$1:Lcom/boyaa/downloader/service/DownloadService$2;

    # getter for: Lcom/boyaa/downloader/service/DownloadService$2;->this$0:Lcom/boyaa/downloader/service/DownloadService;
    invoke-static {v3}, Lcom/boyaa/downloader/service/DownloadService$2;->access$0(Lcom/boyaa/downloader/service/DownloadService$2;)Lcom/boyaa/downloader/service/DownloadService;

    move-result-object v3

    # getter for: Lcom/boyaa/downloader/service/DownloadService;->mUpdateNotifcation:Landroid/app/Notification;
    invoke-static {v3}, Lcom/boyaa/downloader/service/DownloadService;->access$5(Lcom/boyaa/downloader/service/DownloadService;)Landroid/app/Notification;

    move-result-object v3

    new-instance v4, Landroid/widget/RemoteViews;

    .line 196
    iget-object v5, p0, Lcom/boyaa/downloader/service/DownloadService$2$1;->this$1:Lcom/boyaa/downloader/service/DownloadService$2;

    # getter for: Lcom/boyaa/downloader/service/DownloadService$2;->this$0:Lcom/boyaa/downloader/service/DownloadService;
    invoke-static {v5}, Lcom/boyaa/downloader/service/DownloadService$2;->access$0(Lcom/boyaa/downloader/service/DownloadService$2;)Lcom/boyaa/downloader/service/DownloadService;

    move-result-object v5

    invoke-virtual {v5}, Lcom/boyaa/downloader/service/DownloadService;->getPackageName()Ljava/lang/String;

    move-result-object v5

    .line 197
    const v6, 0x7f030007

    invoke-direct {v4, v5, v6}, Landroid/widget/RemoteViews;-><init>(Ljava/lang/String;I)V

    .line 195
    iput-object v4, v3, Landroid/app/Notification;->contentView:Landroid/widget/RemoteViews;

    .line 198
    iget-object v3, p0, Lcom/boyaa/downloader/service/DownloadService$2$1;->this$1:Lcom/boyaa/downloader/service/DownloadService$2;

    # getter for: Lcom/boyaa/downloader/service/DownloadService$2;->this$0:Lcom/boyaa/downloader/service/DownloadService;
    invoke-static {v3}, Lcom/boyaa/downloader/service/DownloadService$2;->access$0(Lcom/boyaa/downloader/service/DownloadService$2;)Lcom/boyaa/downloader/service/DownloadService;

    move-result-object v3

    new-instance v4, Landroid/content/Intent;

    invoke-direct {v4}, Landroid/content/Intent;-><init>()V

    invoke-static {v3, v7, v4, v7}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v0

    .line 199
    .local v0, "pIntent":Landroid/app/PendingIntent;
    iget-object v3, p0, Lcom/boyaa/downloader/service/DownloadService$2$1;->this$1:Lcom/boyaa/downloader/service/DownloadService$2;

    # getter for: Lcom/boyaa/downloader/service/DownloadService$2;->this$0:Lcom/boyaa/downloader/service/DownloadService;
    invoke-static {v3}, Lcom/boyaa/downloader/service/DownloadService$2;->access$0(Lcom/boyaa/downloader/service/DownloadService$2;)Lcom/boyaa/downloader/service/DownloadService;

    move-result-object v3

    # getter for: Lcom/boyaa/downloader/service/DownloadService;->mUpdateNotifcation:Landroid/app/Notification;
    invoke-static {v3}, Lcom/boyaa/downloader/service/DownloadService;->access$5(Lcom/boyaa/downloader/service/DownloadService;)Landroid/app/Notification;

    move-result-object v3

    iput-object v0, v3, Landroid/app/Notification;->contentIntent:Landroid/app/PendingIntent;

    .line 200
    iget-object v3, p0, Lcom/boyaa/downloader/service/DownloadService$2$1;->this$1:Lcom/boyaa/downloader/service/DownloadService$2;

    # getter for: Lcom/boyaa/downloader/service/DownloadService$2;->this$0:Lcom/boyaa/downloader/service/DownloadService;
    invoke-static {v3}, Lcom/boyaa/downloader/service/DownloadService$2;->access$0(Lcom/boyaa/downloader/service/DownloadService$2;)Lcom/boyaa/downloader/service/DownloadService;

    move-result-object v3

    # getter for: Lcom/boyaa/downloader/service/DownloadService;->mUpdateNotifcation:Landroid/app/Notification;
    invoke-static {v3}, Lcom/boyaa/downloader/service/DownloadService;->access$5(Lcom/boyaa/downloader/service/DownloadService;)Landroid/app/Notification;

    move-result-object v3

    iget v4, v3, Landroid/app/Notification;->flags:I

    or-int/lit8 v4, v4, 0x20

    iput v4, v3, Landroid/app/Notification;->flags:I

    .line 205
    .end local v0    # "pIntent":Landroid/app/PendingIntent;
    :cond_0
    int-to-float v3, p1

    .line 206
    iget-object v4, p0, Lcom/boyaa/downloader/service/DownloadService$2$1;->this$1:Lcom/boyaa/downloader/service/DownloadService$2;

    # getter for: Lcom/boyaa/downloader/service/DownloadService$2;->this$0:Lcom/boyaa/downloader/service/DownloadService;
    invoke-static {v4}, Lcom/boyaa/downloader/service/DownloadService$2;->access$0(Lcom/boyaa/downloader/service/DownloadService$2;)Lcom/boyaa/downloader/service/DownloadService;

    move-result-object v4

    # getter for: Lcom/boyaa/downloader/service/DownloadService;->mUpdater:Lcom/boyaa/downloader/network/FileDownloader;
    invoke-static {v4}, Lcom/boyaa/downloader/service/DownloadService;->access$4(Lcom/boyaa/downloader/service/DownloadService;)Lcom/boyaa/downloader/network/FileDownloader;

    move-result-object v4

    invoke-virtual {v4}, Lcom/boyaa/downloader/network/FileDownloader;->getFileSize()I

    move-result v4

    int-to-float v4, v4

    .line 205
    div-float v2, v3, v4

    .line 207
    .local v2, "temp":F
    const/high16 v3, 0x42c80000    # 100.0f

    mul-float/2addr v3, v2

    float-to-int v1, v3

    .line 209
    .local v1, "prog":I
    iget-object v3, p0, Lcom/boyaa/downloader/service/DownloadService$2$1;->this$1:Lcom/boyaa/downloader/service/DownloadService$2;

    # getter for: Lcom/boyaa/downloader/service/DownloadService$2;->this$0:Lcom/boyaa/downloader/service/DownloadService;
    invoke-static {v3}, Lcom/boyaa/downloader/service/DownloadService$2;->access$0(Lcom/boyaa/downloader/service/DownloadService$2;)Lcom/boyaa/downloader/service/DownloadService;

    move-result-object v3

    # getter for: Lcom/boyaa/downloader/service/DownloadService;->mUpdateNotifcation:Landroid/app/Notification;
    invoke-static {v3}, Lcom/boyaa/downloader/service/DownloadService;->access$5(Lcom/boyaa/downloader/service/DownloadService;)Landroid/app/Notification;

    move-result-object v3

    iget-object v3, v3, Landroid/app/Notification;->contentView:Landroid/widget/RemoteViews;

    .line 210
    const v4, 0x7f060023

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "2131165187\u4e0b\u8f7d\u4e2d\uff1a"

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "%"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 209
    invoke-virtual {v3, v4, v5}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    .line 211
    iget-object v3, p0, Lcom/boyaa/downloader/service/DownloadService$2$1;->this$1:Lcom/boyaa/downloader/service/DownloadService$2;

    # getter for: Lcom/boyaa/downloader/service/DownloadService$2;->this$0:Lcom/boyaa/downloader/service/DownloadService;
    invoke-static {v3}, Lcom/boyaa/downloader/service/DownloadService$2;->access$0(Lcom/boyaa/downloader/service/DownloadService$2;)Lcom/boyaa/downloader/service/DownloadService;

    move-result-object v3

    # getter for: Lcom/boyaa/downloader/service/DownloadService;->mUpdateNotifcation:Landroid/app/Notification;
    invoke-static {v3}, Lcom/boyaa/downloader/service/DownloadService;->access$5(Lcom/boyaa/downloader/service/DownloadService;)Landroid/app/Notification;

    move-result-object v3

    iget-object v3, v3, Landroid/app/Notification;->contentView:Landroid/widget/RemoteViews;

    .line 212
    const v4, 0x7f060024

    const/16 v5, 0x64

    .line 211
    invoke-virtual {v3, v4, v5, v1, v7}, Landroid/widget/RemoteViews;->setProgressBar(IIIZ)V

    .line 215
    iget-object v3, p0, Lcom/boyaa/downloader/service/DownloadService$2$1;->this$1:Lcom/boyaa/downloader/service/DownloadService$2;

    # getter for: Lcom/boyaa/downloader/service/DownloadService$2;->this$0:Lcom/boyaa/downloader/service/DownloadService;
    invoke-static {v3}, Lcom/boyaa/downloader/service/DownloadService$2;->access$0(Lcom/boyaa/downloader/service/DownloadService$2;)Lcom/boyaa/downloader/service/DownloadService;

    move-result-object v3

    # getter for: Lcom/boyaa/downloader/service/DownloadService;->mManager:Landroid/app/NotificationManager;
    invoke-static {v3}, Lcom/boyaa/downloader/service/DownloadService;->access$7(Lcom/boyaa/downloader/service/DownloadService;)Landroid/app/NotificationManager;

    move-result-object v3

    const v4, 0x7f030006

    iget-object v5, p0, Lcom/boyaa/downloader/service/DownloadService$2$1;->this$1:Lcom/boyaa/downloader/service/DownloadService$2;

    # getter for: Lcom/boyaa/downloader/service/DownloadService$2;->this$0:Lcom/boyaa/downloader/service/DownloadService;
    invoke-static {v5}, Lcom/boyaa/downloader/service/DownloadService$2;->access$0(Lcom/boyaa/downloader/service/DownloadService$2;)Lcom/boyaa/downloader/service/DownloadService;

    move-result-object v5

    # getter for: Lcom/boyaa/downloader/service/DownloadService;->mUpdateNotifcation:Landroid/app/Notification;
    invoke-static {v5}, Lcom/boyaa/downloader/service/DownloadService;->access$5(Lcom/boyaa/downloader/service/DownloadService;)Landroid/app/Notification;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 216
    return-void
.end method
