.class Lcom/boyaa/app/AppStartDialog$1;
.super Ljava/lang/Object;
.source "AppStartDialog.java"

# interfaces
.implements Landroid/media/MediaPlayer$OnCompletionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/app/AppStartDialog;->playVedio(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/app/AppStartDialog;


# direct methods
.method constructor <init>(Lcom/boyaa/app/AppStartDialog;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/app/AppStartDialog$1;->this$0:Lcom/boyaa/app/AppStartDialog;

    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompletion(Landroid/media/MediaPlayer;)V
    .locals 2
    .param p1, "mp"    # Landroid/media/MediaPlayer;

    .prologue
    .line 72
    iget-object v0, p0, Lcom/boyaa/app/AppStartDialog$1;->this$0:Lcom/boyaa/app/AppStartDialog;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/boyaa/app/AppStartDialog;->access$0(Lcom/boyaa/app/AppStartDialog;Z)V

    .line 73
    iget-object v0, p0, Lcom/boyaa/app/AppStartDialog$1;->this$0:Lcom/boyaa/app/AppStartDialog;

    # invokes: Lcom/boyaa/app/AppStartDialog;->onVideoOrImageShowingFinished()V
    invoke-static {v0}, Lcom/boyaa/app/AppStartDialog;->access$1(Lcom/boyaa/app/AppStartDialog;)V

    .line 74
    return-void
.end method
