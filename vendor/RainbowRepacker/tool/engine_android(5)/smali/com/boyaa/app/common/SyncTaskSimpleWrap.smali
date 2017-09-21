.class public final Lcom/boyaa/app/common/SyncTaskSimpleWrap;
.super Landroid/os/AsyncTask;
.source "SyncTaskSimpleWrap.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field private act:Landroid/app/Activity;

.field private enableAbort:Z

.field private thread:Lcom/boyaa/app/common/OnThreadTask;


# direct methods
.method public constructor <init>(Landroid/app/Activity;Lcom/boyaa/app/common/OnThreadTask;Z)V
    .locals 0
    .param p1, "act"    # Landroid/app/Activity;
    .param p2, "thread"    # Lcom/boyaa/app/common/OnThreadTask;
    .param p3, "enableAbort"    # Z

    .prologue
    .line 18
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 20
    iput-object p1, p0, Lcom/boyaa/app/common/SyncTaskSimpleWrap;->act:Landroid/app/Activity;

    .line 21
    iput-object p2, p0, Lcom/boyaa/app/common/SyncTaskSimpleWrap;->thread:Lcom/boyaa/app/common/OnThreadTask;

    .line 22
    iput-boolean p3, p0, Lcom/boyaa/app/common/SyncTaskSimpleWrap;->enableAbort:Z

    .line 23
    return-void
.end method

.method static synthetic access$2(Lcom/boyaa/app/common/SyncTaskSimpleWrap;)Lcom/boyaa/app/common/OnThreadTask;
    .locals 1

    .prologue
    .line 16
    iget-object v0, p0, Lcom/boyaa/app/common/SyncTaskSimpleWrap;->thread:Lcom/boyaa/app/common/OnThreadTask;

    return-object v0
.end method


# virtual methods
.method protected bridge varargs synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/boyaa/app/common/SyncTaskSimpleWrap;->doInBackground([Ljava/lang/Void;)Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/lang/Void;
    .locals 1
    .param p1, "params"    # [Ljava/lang/Void;

    .prologue
    .line 52
    :try_start_0
    iget-object v0, p0, Lcom/boyaa/app/common/SyncTaskSimpleWrap;->thread:Lcom/boyaa/app/common/OnThreadTask;

    invoke-virtual {v0}, Lcom/boyaa/app/common/OnThreadTask;->onThreadRun()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 58
    :goto_0
    const/4 v0, 0x0

    return-object v0

    .line 54
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 1
    check-cast p1, Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/boyaa/app/common/SyncTaskSimpleWrap;->onPostExecute(Ljava/lang/Void;)V

    return-void
.end method

.method protected onPostExecute(Ljava/lang/Void;)V
    .locals 2
    .param p1, "val"    # Ljava/lang/Void;

    .prologue
    const/4 v1, 0x0

    .line 63
    iget-object v0, p0, Lcom/boyaa/app/common/SyncTaskSimpleWrap;->thread:Lcom/boyaa/app/common/OnThreadTask;

    iget-boolean v0, v0, Lcom/boyaa/app/common/OnThreadTask;->backPressed:Z

    if-eqz v0, :cond_0

    .line 66
    iget-object v0, p0, Lcom/boyaa/app/common/SyncTaskSimpleWrap;->thread:Lcom/boyaa/app/common/OnThreadTask;

    iput-object v1, v0, Lcom/boyaa/app/common/OnThreadTask;->progressDialog:Lcom/boyaa/app/common/BoyaaProgressDialog;

    .line 78
    :goto_0
    return-void

    .line 71
    :cond_0
    iget-object v0, p0, Lcom/boyaa/app/common/SyncTaskSimpleWrap;->thread:Lcom/boyaa/app/common/OnThreadTask;

    iget-object v0, v0, Lcom/boyaa/app/common/OnThreadTask;->progressDialog:Lcom/boyaa/app/common/BoyaaProgressDialog;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/boyaa/app/common/SyncTaskSimpleWrap;->act:Landroid/app/Activity;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/boyaa/app/common/SyncTaskSimpleWrap;->act:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_1

    .line 73
    iget-object v0, p0, Lcom/boyaa/app/common/SyncTaskSimpleWrap;->thread:Lcom/boyaa/app/common/OnThreadTask;

    iget-object v0, v0, Lcom/boyaa/app/common/OnThreadTask;->progressDialog:Lcom/boyaa/app/common/BoyaaProgressDialog;

    invoke-virtual {v0}, Lcom/boyaa/app/common/BoyaaProgressDialog;->dismiss()V

    .line 74
    iget-object v0, p0, Lcom/boyaa/app/common/SyncTaskSimpleWrap;->thread:Lcom/boyaa/app/common/OnThreadTask;

    iput-object v1, v0, Lcom/boyaa/app/common/OnThreadTask;->progressDialog:Lcom/boyaa/app/common/BoyaaProgressDialog;

    .line 76
    :cond_1
    iget-object v0, p0, Lcom/boyaa/app/common/SyncTaskSimpleWrap;->thread:Lcom/boyaa/app/common/OnThreadTask;

    invoke-virtual {v0}, Lcom/boyaa/app/common/OnThreadTask;->onAfterUIRun()V

    goto :goto_0
.end method

.method protected onPreExecute()V
    .locals 3

    .prologue
    .line 27
    iget-object v0, p0, Lcom/boyaa/app/common/SyncTaskSimpleWrap;->thread:Lcom/boyaa/app/common/OnThreadTask;

    iget-object v0, v0, Lcom/boyaa/app/common/OnThreadTask;->tips:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/boyaa/app/common/SyncTaskSimpleWrap;->thread:Lcom/boyaa/app/common/OnThreadTask;

    iget-object v0, v0, Lcom/boyaa/app/common/OnThreadTask;->tips:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/boyaa/app/common/SyncTaskSimpleWrap;->act:Landroid/app/Activity;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/boyaa/app/common/SyncTaskSimpleWrap;->act:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_0

    .line 29
    iget-object v0, p0, Lcom/boyaa/app/common/SyncTaskSimpleWrap;->thread:Lcom/boyaa/app/common/OnThreadTask;

    iget-object v1, p0, Lcom/boyaa/app/common/SyncTaskSimpleWrap;->act:Landroid/app/Activity;

    iget-object v2, p0, Lcom/boyaa/app/common/SyncTaskSimpleWrap;->thread:Lcom/boyaa/app/common/OnThreadTask;

    iget-object v2, v2, Lcom/boyaa/app/common/OnThreadTask;->tips:Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/boyaa/app/common/BoyaaProgressDialog;->show(Landroid/app/Activity;Ljava/lang/CharSequence;)Lcom/boyaa/app/common/BoyaaProgressDialog;

    move-result-object v1

    iput-object v1, v0, Lcom/boyaa/app/common/OnThreadTask;->progressDialog:Lcom/boyaa/app/common/BoyaaProgressDialog;

    .line 30
    iget-boolean v0, p0, Lcom/boyaa/app/common/SyncTaskSimpleWrap;->enableAbort:Z

    if-nez v0, :cond_1

    .line 44
    :cond_0
    :goto_0
    return-void

    .line 31
    :cond_1
    iget-object v0, p0, Lcom/boyaa/app/common/SyncTaskSimpleWrap;->thread:Lcom/boyaa/app/common/OnThreadTask;

    iget-object v0, v0, Lcom/boyaa/app/common/OnThreadTask;->progressDialog:Lcom/boyaa/app/common/BoyaaProgressDialog;

    new-instance v1, Lcom/boyaa/app/common/SyncTaskSimpleWrap$1;

    invoke-direct {v1, p0}, Lcom/boyaa/app/common/SyncTaskSimpleWrap$1;-><init>(Lcom/boyaa/app/common/SyncTaskSimpleWrap;)V

    invoke-virtual {v0, v1}, Lcom/boyaa/app/common/BoyaaProgressDialog;->setOnCancelListener(Lcom/boyaa/app/common/BoyaaProgressDialog$onCancelListener;)V

    goto :goto_0
.end method
