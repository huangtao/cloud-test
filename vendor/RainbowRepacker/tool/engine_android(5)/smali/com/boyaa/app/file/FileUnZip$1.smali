.class Lcom/boyaa/app/file/FileUnZip$1;
.super Lcom/boyaa/app/common/OnThreadTask;
.source "FileUnZip.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/app/file/FileUnZip;->doDownLoad(Ljava/lang/String;Ljava/lang/String;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field saveSuccess:Z

.field final synthetic this$0:Lcom/boyaa/app/file/FileUnZip;

.field unZipSuccess:Z

.field private final synthetic val$httpUrl:Ljava/lang/String;

.field private final synthetic val$savePath:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/boyaa/app/file/FileUnZip;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 1
    iput-object p1, p0, Lcom/boyaa/app/file/FileUnZip$1;->this$0:Lcom/boyaa/app/file/FileUnZip;

    iput-object p2, p0, Lcom/boyaa/app/file/FileUnZip$1;->val$httpUrl:Ljava/lang/String;

    iput-object p3, p0, Lcom/boyaa/app/file/FileUnZip$1;->val$savePath:Ljava/lang/String;

    .line 25
    invoke-direct {p0}, Lcom/boyaa/app/common/OnThreadTask;-><init>()V

    .line 26
    iput-boolean v0, p0, Lcom/boyaa/app/file/FileUnZip$1;->saveSuccess:Z

    .line 27
    iput-boolean v0, p0, Lcom/boyaa/app/file/FileUnZip$1;->unZipSuccess:Z

    return-void
.end method


# virtual methods
.method public onAfterUIRun()V
    .locals 2

    .prologue
    .line 37
    sget-object v0, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    new-instance v1, Lcom/boyaa/app/file/FileUnZip$1$1;

    invoke-direct {v1, p0}, Lcom/boyaa/app/file/FileUnZip$1$1;-><init>(Lcom/boyaa/app/file/FileUnZip$1;)V

    invoke-virtual {v0, v1}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->runOnLuaThread(Ljava/lang/Runnable;)V

    .line 44
    return-void
.end method

.method public onThreadRun()V
    .locals 4

    .prologue
    .line 30
    iget-object v1, p0, Lcom/boyaa/app/file/FileUnZip$1;->this$0:Lcom/boyaa/app/file/FileUnZip;

    iget-object v2, p0, Lcom/boyaa/app/file/FileUnZip$1;->val$httpUrl:Ljava/lang/String;

    iget-object v3, p0, Lcom/boyaa/app/file/FileUnZip$1;->val$savePath:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Lcom/boyaa/app/file/FileUnZip;->httpDownload(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    iput-boolean v1, p0, Lcom/boyaa/app/file/FileUnZip$1;->saveSuccess:Z

    .line 31
    new-instance v0, Lcom/boyaa/app/file/ZipUtil;

    invoke-direct {v0}, Lcom/boyaa/app/file/ZipUtil;-><init>()V

    .line 32
    .local v0, "zipUtil":Lcom/boyaa/app/file/ZipUtil;
    iget-object v1, p0, Lcom/boyaa/app/file/FileUnZip$1;->val$savePath:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/boyaa/app/file/ZipUtil;->Unzip(Ljava/lang/String;)Z

    move-result v1

    iput-boolean v1, p0, Lcom/boyaa/app/file/FileUnZip$1;->unZipSuccess:Z

    .line 33
    return-void
.end method

.method public onUIBackPressed()V
    .locals 0

    .prologue
    .line 49
    return-void
.end method
