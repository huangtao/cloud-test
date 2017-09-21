.class public abstract Lcom/boyaa/app/common/OnThreadTask;
.super Ljava/lang/Object;
.source "OnThreadTask.java"


# instance fields
.field public volatile backPressed:Z

.field public progressDialog:Lcom/boyaa/app/common/BoyaaProgressDialog;

.field public tips:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/boyaa/app/common/OnThreadTask;->backPressed:Z

    .line 3
    return-void
.end method


# virtual methods
.method public abstract onAfterUIRun()V
.end method

.method public abstract onThreadRun()V
.end method

.method public abstract onUIBackPressed()V
.end method
