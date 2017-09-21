.class Lcom/boyaa/app/file/FileUnZip$1$1;
.super Ljava/lang/Object;
.source "FileUnZip.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/app/file/FileUnZip$1;->onAfterUIRun()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/boyaa/app/file/FileUnZip$1;


# direct methods
.method constructor <init>(Lcom/boyaa/app/file/FileUnZip$1;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/app/file/FileUnZip$1$1;->this$1:Lcom/boyaa/app/file/FileUnZip$1;

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 40
    const-string v1, "getUpdate"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v0, "getUpdate  \u6700\u7ec8\u7ed3\u679c\uff1a"

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/boyaa/app/file/FileUnZip$1$1;->this$1:Lcom/boyaa/app/file/FileUnZip$1;

    iget-boolean v0, v0, Lcom/boyaa/app/file/FileUnZip$1;->saveSuccess:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/boyaa/app/file/FileUnZip$1$1;->this$1:Lcom/boyaa/app/file/FileUnZip$1;

    iget-boolean v0, v0, Lcom/boyaa/app/file/FileUnZip$1;->unZipSuccess:Z

    if-eqz v0, :cond_0

    const-string v0, "\u6210\u529f"

    :goto_0
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/boyaa/app/debug/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    invoke-static {}, Lcom/boyaa/app/core/HandlerManager;->getHandlerManager()Lcom/boyaa/app/core/HandlerManager;

    move-result-object v1

    const-string v2, "getUpdate"

    iget-object v0, p0, Lcom/boyaa/app/file/FileUnZip$1$1;->this$1:Lcom/boyaa/app/file/FileUnZip$1;

    iget-boolean v0, v0, Lcom/boyaa/app/file/FileUnZip$1;->saveSuccess:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/boyaa/app/file/FileUnZip$1$1;->this$1:Lcom/boyaa/app/file/FileUnZip$1;

    iget-boolean v0, v0, Lcom/boyaa/app/file/FileUnZip$1;->unZipSuccess:Z

    if-eqz v0, :cond_1

    const-string v0, "success"

    :goto_1
    invoke-virtual {v1, v2, v0}, Lcom/boyaa/app/core/HandlerManager;->luaCallEvent(Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    return-void

    .line 40
    :cond_0
    const-string v0, "\u5931\u8d25"

    goto :goto_0

    .line 41
    :cond_1
    const/4 v0, 0x0

    goto :goto_1
.end method
