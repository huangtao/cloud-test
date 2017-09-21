.class Lcom/boyaa/widget/LoadingDialog$1;
.super Ljava/lang/Object;
.source "LoadingDialog.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/boyaa/widget/LoadingDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/widget/LoadingDialog;


# direct methods
.method constructor <init>(Lcom/boyaa/widget/LoadingDialog;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/widget/LoadingDialog$1;->this$0:Lcom/boyaa/widget/LoadingDialog;

    .line 135
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 140
    iget-object v0, p0, Lcom/boyaa/widget/LoadingDialog$1;->this$0:Lcom/boyaa/widget/LoadingDialog;

    invoke-virtual {v0}, Lcom/boyaa/widget/LoadingDialog;->dismiss()V

    .line 141
    return-void
.end method
