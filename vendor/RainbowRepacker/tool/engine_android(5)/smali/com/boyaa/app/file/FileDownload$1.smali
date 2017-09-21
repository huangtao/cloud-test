.class Lcom/boyaa/app/file/FileDownload$1;
.super Lcom/boyaa/app/common/OnThreadTask;
.source "FileDownload.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/app/file/FileDownload;->onDoDownload(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field saveSuccess:Z

.field final synthetic this$0:Lcom/boyaa/app/file/FileDownload;

.field private final synthetic val$callLuaEvent:Ljava/lang/String;

.field private final synthetic val$loadUrl:Ljava/lang/String;

.field private final synthetic val$savePath:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/boyaa/app/file/FileDownload;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/app/file/FileDownload$1;->this$0:Lcom/boyaa/app/file/FileDownload;

    iput-object p2, p0, Lcom/boyaa/app/file/FileDownload$1;->val$loadUrl:Ljava/lang/String;

    iput-object p3, p0, Lcom/boyaa/app/file/FileDownload$1;->val$savePath:Ljava/lang/String;

    iput-object p4, p0, Lcom/boyaa/app/file/FileDownload$1;->val$callLuaEvent:Ljava/lang/String;

    .line 44
    invoke-direct {p0}, Lcom/boyaa/app/common/OnThreadTask;-><init>()V

    .line 45
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/boyaa/app/file/FileDownload$1;->saveSuccess:Z

    return-void
.end method


# virtual methods
.method public onAfterUIRun()V
    .locals 3

    .prologue
    .line 54
    sget-object v0, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    new-instance v1, Lcom/boyaa/app/file/FileDownload$1$1;

    iget-object v2, p0, Lcom/boyaa/app/file/FileDownload$1;->val$callLuaEvent:Ljava/lang/String;

    invoke-direct {v1, p0, v2}, Lcom/boyaa/app/file/FileDownload$1$1;-><init>(Lcom/boyaa/app/file/FileDownload$1;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->runOnLuaThread(Ljava/lang/Runnable;)V

    .line 61
    return-void
.end method

.method public onThreadRun()V
    .locals 3

    .prologue
    .line 48
    const-string v0, "FileDownload"

    const-string v1, "\u5f00\u59cb\u4e0b\u8f7d...."

    invoke-static {v0, v1}, Lcom/boyaa/app/debug/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 49
    iget-object v0, p0, Lcom/boyaa/app/file/FileDownload$1;->this$0:Lcom/boyaa/app/file/FileDownload;

    iget-object v1, p0, Lcom/boyaa/app/file/FileDownload$1;->val$loadUrl:Ljava/lang/String;

    iget-object v2, p0, Lcom/boyaa/app/file/FileDownload$1;->val$savePath:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/boyaa/app/file/FileDownload;->httpDownload(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/boyaa/app/file/FileDownload$1;->saveSuccess:Z

    .line 50
    return-void
.end method

.method public onUIBackPressed()V
    .locals 0

    .prologue
    .line 66
    return-void
.end method
