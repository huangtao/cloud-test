.class Lcom/boyaa/app/common/SyncTaskSimpleWrap$1;
.super Ljava/lang/Object;
.source "SyncTaskSimpleWrap.java"

# interfaces
.implements Lcom/boyaa/app/common/BoyaaProgressDialog$onCancelListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/app/common/SyncTaskSimpleWrap;->onPreExecute()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/app/common/SyncTaskSimpleWrap;


# direct methods
.method constructor <init>(Lcom/boyaa/app/common/SyncTaskSimpleWrap;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/app/common/SyncTaskSimpleWrap$1;->this$0:Lcom/boyaa/app/common/SyncTaskSimpleWrap;

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancel()V
    .locals 2

    .prologue
    .line 34
    iget-object v0, p0, Lcom/boyaa/app/common/SyncTaskSimpleWrap$1;->this$0:Lcom/boyaa/app/common/SyncTaskSimpleWrap;

    # getter for: Lcom/boyaa/app/common/SyncTaskSimpleWrap;->thread:Lcom/boyaa/app/common/OnThreadTask;
    invoke-static {v0}, Lcom/boyaa/app/common/SyncTaskSimpleWrap;->access$2(Lcom/boyaa/app/common/SyncTaskSimpleWrap;)Lcom/boyaa/app/common/OnThreadTask;

    move-result-object v0

    iget-object v0, v0, Lcom/boyaa/app/common/OnThreadTask;->progressDialog:Lcom/boyaa/app/common/BoyaaProgressDialog;

    if-eqz v0, :cond_0

    .line 36
    iget-object v0, p0, Lcom/boyaa/app/common/SyncTaskSimpleWrap$1;->this$0:Lcom/boyaa/app/common/SyncTaskSimpleWrap;

    # getter for: Lcom/boyaa/app/common/SyncTaskSimpleWrap;->thread:Lcom/boyaa/app/common/OnThreadTask;
    invoke-static {v0}, Lcom/boyaa/app/common/SyncTaskSimpleWrap;->access$2(Lcom/boyaa/app/common/SyncTaskSimpleWrap;)Lcom/boyaa/app/common/OnThreadTask;

    move-result-object v0

    iget-object v0, v0, Lcom/boyaa/app/common/OnThreadTask;->progressDialog:Lcom/boyaa/app/common/BoyaaProgressDialog;

    invoke-virtual {v0}, Lcom/boyaa/app/common/BoyaaProgressDialog;->dismiss()V

    .line 37
    iget-object v0, p0, Lcom/boyaa/app/common/SyncTaskSimpleWrap$1;->this$0:Lcom/boyaa/app/common/SyncTaskSimpleWrap;

    # getter for: Lcom/boyaa/app/common/SyncTaskSimpleWrap;->thread:Lcom/boyaa/app/common/OnThreadTask;
    invoke-static {v0}, Lcom/boyaa/app/common/SyncTaskSimpleWrap;->access$2(Lcom/boyaa/app/common/SyncTaskSimpleWrap;)Lcom/boyaa/app/common/OnThreadTask;

    move-result-object v0

    const/4 v1, 0x0

    iput-object v1, v0, Lcom/boyaa/app/common/OnThreadTask;->progressDialog:Lcom/boyaa/app/common/BoyaaProgressDialog;

    .line 39
    :cond_0
    iget-object v0, p0, Lcom/boyaa/app/common/SyncTaskSimpleWrap$1;->this$0:Lcom/boyaa/app/common/SyncTaskSimpleWrap;

    # getter for: Lcom/boyaa/app/common/SyncTaskSimpleWrap;->thread:Lcom/boyaa/app/common/OnThreadTask;
    invoke-static {v0}, Lcom/boyaa/app/common/SyncTaskSimpleWrap;->access$2(Lcom/boyaa/app/common/SyncTaskSimpleWrap;)Lcom/boyaa/app/common/OnThreadTask;

    move-result-object v0

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/boyaa/app/common/OnThreadTask;->backPressed:Z

    .line 40
    iget-object v0, p0, Lcom/boyaa/app/common/SyncTaskSimpleWrap$1;->this$0:Lcom/boyaa/app/common/SyncTaskSimpleWrap;

    # getter for: Lcom/boyaa/app/common/SyncTaskSimpleWrap;->thread:Lcom/boyaa/app/common/OnThreadTask;
    invoke-static {v0}, Lcom/boyaa/app/common/SyncTaskSimpleWrap;->access$2(Lcom/boyaa/app/common/SyncTaskSimpleWrap;)Lcom/boyaa/app/common/OnThreadTask;

    move-result-object v0

    invoke-virtual {v0}, Lcom/boyaa/app/common/OnThreadTask;->onUIBackPressed()V

    .line 41
    return-void
.end method
