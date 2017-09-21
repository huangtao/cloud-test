.class Lcom/boyaa/engine/made/AppEditBoxView$5;
.super Ljava/lang/Object;
.source "AppEditBoxView.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


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
    .line 271
    iput-object p1, p0, Lcom/boyaa/engine/made/AppEditBoxView$5;->this$0:Lcom/boyaa/engine/made/AppEditBoxView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "arg0"    # Landroid/view/View;

    .prologue
    .line 274
    iget-object v0, p0, Lcom/boyaa/engine/made/AppEditBoxView$5;->this$0:Lcom/boyaa/engine/made/AppEditBoxView;

    # invokes: Lcom/boyaa/engine/made/AppEditBoxView;->inputCancel()V
    invoke-static {v0}, Lcom/boyaa/engine/made/AppEditBoxView;->access$600(Lcom/boyaa/engine/made/AppEditBoxView;)V

    .line 275
    return-void
.end method
