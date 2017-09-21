.class Lcom/boyaa/app/AppStartDialog$2;
.super Ljava/lang/Object;
.source "AppStartDialog.java"

# interfaces
.implements Landroid/view/animation/Animation$AnimationListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/app/AppStartDialog;->showStartScreenImage(I)V
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
    iput-object p1, p0, Lcom/boyaa/app/AppStartDialog$2;->this$0:Lcom/boyaa/app/AppStartDialog;

    .line 89
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/view/animation/Animation;)V
    .locals 1
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 101
    iget-object v0, p0, Lcom/boyaa/app/AppStartDialog$2;->this$0:Lcom/boyaa/app/AppStartDialog;

    # invokes: Lcom/boyaa/app/AppStartDialog;->onVideoOrImageShowingFinished()V
    invoke-static {v0}, Lcom/boyaa/app/AppStartDialog;->access$1(Lcom/boyaa/app/AppStartDialog;)V

    .line 102
    return-void
.end method

.method public onAnimationRepeat(Landroid/view/animation/Animation;)V
    .locals 0
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 97
    return-void
.end method

.method public onAnimationStart(Landroid/view/animation/Animation;)V
    .locals 0
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 93
    return-void
.end method
