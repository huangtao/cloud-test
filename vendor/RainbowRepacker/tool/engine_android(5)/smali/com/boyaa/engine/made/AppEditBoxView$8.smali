.class Lcom/boyaa/engine/made/AppEditBoxView$8;
.super Ljava/lang/Object;
.source "AppEditBoxView.java"

# interfaces
.implements Landroid/view/View$OnKeyListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/engine/made/AppEditBoxView;->initUI()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/engine/made/AppEditBoxView;


# direct methods
.method constructor <init>(Lcom/boyaa/engine/made/AppEditBoxView;)V
    .locals 0

    .prologue
    .line 377
    iput-object p1, p0, Lcom/boyaa/engine/made/AppEditBoxView$8;->this$0:Lcom/boyaa/engine/made/AppEditBoxView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onKey(Landroid/view/View;ILandroid/view/KeyEvent;)Z
    .locals 1
    .param p1, "v"    # Landroid/view/View;
    .param p2, "keyCode"    # I
    .param p3, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 381
    const/4 v0, 0x4

    if-ne p2, v0, :cond_0

    .line 382
    iget-object v0, p0, Lcom/boyaa/engine/made/AppEditBoxView$8;->this$0:Lcom/boyaa/engine/made/AppEditBoxView;

    # invokes: Lcom/boyaa/engine/made/AppEditBoxView;->inputCancel()V
    invoke-static {v0}, Lcom/boyaa/engine/made/AppEditBoxView;->access$600(Lcom/boyaa/engine/made/AppEditBoxView;)V

    .line 383
    const/4 v0, 0x1

    .line 385
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
