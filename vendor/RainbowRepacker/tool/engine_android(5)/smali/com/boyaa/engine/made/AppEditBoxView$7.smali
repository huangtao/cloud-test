.class Lcom/boyaa/engine/made/AppEditBoxView$7;
.super Ljava/lang/Object;
.source "AppEditBoxView.java"

# interfaces
.implements Landroid/widget/TextView$OnEditorActionListener;


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
    .line 354
    iput-object p1, p0, Lcom/boyaa/engine/made/AppEditBoxView$7;->this$0:Lcom/boyaa/engine/made/AppEditBoxView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onEditorAction(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 2
    .param p1, "v"    # Landroid/widget/TextView;
    .param p2, "actionId"    # I
    .param p3, "event"    # Landroid/view/KeyEvent;

    .prologue
    const/4 v1, 0x0

    .line 363
    if-nez p2, :cond_0

    if-nez p2, :cond_1

    if-eqz p3, :cond_1

    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    if-nez v0, :cond_1

    .line 366
    :cond_0
    iget-object v0, p0, Lcom/boyaa/engine/made/AppEditBoxView$7;->this$0:Lcom/boyaa/engine/made/AppEditBoxView;

    # invokes: Lcom/boyaa/engine/made/AppEditBoxView;->inputDone()V
    invoke-static {v0}, Lcom/boyaa/engine/made/AppEditBoxView;->access$900(Lcom/boyaa/engine/made/AppEditBoxView;)V

    .line 369
    :cond_1
    return v1
.end method
