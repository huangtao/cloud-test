.class public Lcom/boyaa/app/download/DownloadHandler$DownloadItem;
.super Ljava/lang/Object;
.source "DownloadHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/boyaa/app/download/DownloadHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "DownloadItem"
.end annotation


# instance fields
.field public downloadId:J

.field public name:Ljava/lang/String;

.field public path:Ljava/lang/String;

.field final synthetic this$0:Lcom/boyaa/app/download/DownloadHandler;

.field public type:Ljava/lang/String;

.field public url:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/boyaa/app/download/DownloadHandler;)V
    .locals 0

    .prologue
    .line 360
    iput-object p1, p0, Lcom/boyaa/app/download/DownloadHandler$DownloadItem;->this$0:Lcom/boyaa/app/download/DownloadHandler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
