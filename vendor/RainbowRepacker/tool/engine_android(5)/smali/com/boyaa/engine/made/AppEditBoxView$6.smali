.class Lcom/boyaa/engine/made/AppEditBoxView$6;
.super Ljava/lang/Object;
.source "AppEditBoxView.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


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
    .line 281
    iput-object p1, p0, Lcom/boyaa/engine/made/AppEditBoxView$6;->this$0:Lcom/boyaa/engine/made/AppEditBoxView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onGlobalLayout()V
    .locals 12

    .prologue
    const/4 v8, 0x1

    const/4 v9, 0x0

    .line 285
    new-instance v3, Landroid/graphics/Rect;

    invoke-direct {v3}, Landroid/graphics/Rect;-><init>()V

    .line 288
    .local v3, "r":Landroid/graphics/Rect;
    invoke-static {}, Lcom/boyaa/engine/made/AppActivity;->getInstance()Lcom/boyaa/engine/made/AppActivity;

    move-result-object v10

    invoke-virtual {v10}, Lcom/boyaa/engine/made/AppActivity;->getWindow()Landroid/view/Window;

    move-result-object v10

    invoke-virtual {v10}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v10

    invoke-virtual {v10, v3}, Landroid/view/View;->getWindowVisibleDisplayFrame(Landroid/graphics/Rect;)V

    .line 289
    invoke-static {}, Lcom/boyaa/engine/made/AppActivity;->getInstance()Lcom/boyaa/engine/made/AppActivity;

    move-result-object v10

    invoke-virtual {v10}, Lcom/boyaa/engine/made/AppActivity;->getWindow()Landroid/view/Window;

    move-result-object v10

    invoke-virtual {v10}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v10

    invoke-virtual {v10}, Landroid/view/View;->getRootView()Landroid/view/View;

    move-result-object v10

    invoke-virtual {v10}, Landroid/view/View;->getHeight()I

    move-result v4

    .line 290
    .local v4, "screenHeight":I
    invoke-static {}, Lcom/boyaa/engine/made/AppActivity;->getInstance()Lcom/boyaa/engine/made/AppActivity;

    move-result-object v10

    invoke-virtual {v10}, Lcom/boyaa/engine/made/AppActivity;->getWindow()Landroid/view/Window;

    move-result-object v10

    invoke-virtual {v10}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v10

    invoke-virtual {v10}, Landroid/view/View;->getRootView()Landroid/view/View;

    move-result-object v10

    invoke-virtual {v10}, Landroid/view/View;->getWidth()I

    move-result v5

    .line 307
    .local v5, "screenWidth":I
    iget v6, v3, Landroid/graphics/Rect;->top:I

    .line 308
    .local v6, "statusBarHeight":I
    invoke-static {}, Lcom/boyaa/engine/made/AppActivity;->getInstance()Lcom/boyaa/engine/made/AppActivity;

    move-result-object v10

    invoke-virtual {v10}, Lcom/boyaa/engine/made/AppActivity;->getWindow()Landroid/view/Window;

    move-result-object v10

    const v11, 0x1020002

    invoke-virtual {v10, v11}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    move-result-object v10

    invoke-virtual {v10}, Landroid/view/View;->getTop()I

    move-result v0

    .line 309
    .local v0, "contentTop":I
    sub-int v7, v0, v6

    .line 310
    .local v7, "titleBarHeight":I
    iget v10, v3, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr v10, v0

    sub-int v1, v4, v10

    .line 312
    .local v1, "height":I
    div-int/lit8 v10, v4, 0x3

    if-le v1, v10, :cond_2

    move v2, v8

    .line 314
    .local v2, "isKeyboardShowing":Z
    :goto_0
    iget-object v10, p0, Lcom/boyaa/engine/made/AppEditBoxView$6;->this$0:Lcom/boyaa/engine/made/AppEditBoxView;

    # getter for: Lcom/boyaa/engine/made/AppEditBoxView;->mIsSoftKeyboardShowing:Z
    invoke-static {v10}, Lcom/boyaa/engine/made/AppEditBoxView;->access$700(Lcom/boyaa/engine/made/AppEditBoxView;)Z

    move-result v10

    if-nez v10, :cond_0

    if-eqz v2, :cond_0

    .line 315
    iget-object v10, p0, Lcom/boyaa/engine/made/AppEditBoxView$6;->this$0:Lcom/boyaa/engine/made/AppEditBoxView;

    # setter for: Lcom/boyaa/engine/made/AppEditBoxView;->mIsSoftKeyboardShowing:Z
    invoke-static {v10, v2}, Lcom/boyaa/engine/made/AppEditBoxView;->access$702(Lcom/boyaa/engine/made/AppEditBoxView;Z)Z

    .line 316
    iget-object v10, p0, Lcom/boyaa/engine/made/AppEditBoxView$6;->this$0:Lcom/boyaa/engine/made/AppEditBoxView;

    # setter for: Lcom/boyaa/engine/made/AppEditBoxView;->keyboardHeight:I
    invoke-static {v10, v1}, Lcom/boyaa/engine/made/AppEditBoxView;->access$802(Lcom/boyaa/engine/made/AppEditBoxView;I)I

    .line 317
    iget-object v10, p0, Lcom/boyaa/engine/made/AppEditBoxView$6;->this$0:Lcom/boyaa/engine/made/AppEditBoxView;

    # getter for: Lcom/boyaa/engine/made/AppEditBoxView;->mActivity:Lcom/boyaa/engine/made/AppActivity;
    invoke-static {v10}, Lcom/boyaa/engine/made/AppEditBoxView;->access$100(Lcom/boyaa/engine/made/AppEditBoxView;)Lcom/boyaa/engine/made/AppActivity;

    move-result-object v10

    new-instance v11, Lcom/boyaa/engine/made/AppEditBoxView$6$1;

    invoke-direct {v11, p0, v4, v5}, Lcom/boyaa/engine/made/AppEditBoxView$6$1;-><init>(Lcom/boyaa/engine/made/AppEditBoxView$6;II)V

    invoke-virtual {v10, v11}, Lcom/boyaa/engine/made/AppActivity;->runOnLuaThread(Ljava/lang/Runnable;)V

    .line 326
    :cond_0
    iget-object v10, p0, Lcom/boyaa/engine/made/AppEditBoxView$6;->this$0:Lcom/boyaa/engine/made/AppEditBoxView;

    # getter for: Lcom/boyaa/engine/made/AppEditBoxView;->mIsSoftKeyboardShowing:Z
    invoke-static {v10}, Lcom/boyaa/engine/made/AppEditBoxView;->access$700(Lcom/boyaa/engine/made/AppEditBoxView;)Z

    move-result v10

    if-eqz v10, :cond_1

    if-nez v2, :cond_1

    iget-object v10, p0, Lcom/boyaa/engine/made/AppEditBoxView$6;->this$0:Lcom/boyaa/engine/made/AppEditBoxView;

    # getter for: Lcom/boyaa/engine/made/AppEditBoxView;->keyboardHeight:I
    invoke-static {v10}, Lcom/boyaa/engine/made/AppEditBoxView;->access$800(Lcom/boyaa/engine/made/AppEditBoxView;)I

    move-result v10

    if-lez v10, :cond_1

    iget-object v10, p0, Lcom/boyaa/engine/made/AppEditBoxView$6;->this$0:Lcom/boyaa/engine/made/AppEditBoxView;

    # getter for: Lcom/boyaa/engine/made/AppEditBoxView;->keyboardHeight:I
    invoke-static {v10}, Lcom/boyaa/engine/made/AppEditBoxView;->access$800(Lcom/boyaa/engine/made/AppEditBoxView;)I

    move-result v10

    if-ge v1, v10, :cond_1

    .line 327
    iget-object v10, p0, Lcom/boyaa/engine/made/AppEditBoxView$6;->this$0:Lcom/boyaa/engine/made/AppEditBoxView;

    if-nez v2, :cond_3

    :goto_1
    # setter for: Lcom/boyaa/engine/made/AppEditBoxView;->mIsSoftKeyboardShowing:Z
    invoke-static {v10, v8}, Lcom/boyaa/engine/made/AppEditBoxView;->access$702(Lcom/boyaa/engine/made/AppEditBoxView;Z)Z

    .line 328
    iget-object v8, p0, Lcom/boyaa/engine/made/AppEditBoxView$6;->this$0:Lcom/boyaa/engine/made/AppEditBoxView;

    # setter for: Lcom/boyaa/engine/made/AppEditBoxView;->keyboardHeight:I
    invoke-static {v8, v9}, Lcom/boyaa/engine/made/AppEditBoxView;->access$802(Lcom/boyaa/engine/made/AppEditBoxView;I)I

    .line 329
    iget-object v8, p0, Lcom/boyaa/engine/made/AppEditBoxView$6;->this$0:Lcom/boyaa/engine/made/AppEditBoxView;

    # invokes: Lcom/boyaa/engine/made/AppEditBoxView;->inputCancel()V
    invoke-static {v8}, Lcom/boyaa/engine/made/AppEditBoxView;->access$600(Lcom/boyaa/engine/made/AppEditBoxView;)V

    .line 331
    :cond_1
    return-void

    .end local v2    # "isKeyboardShowing":Z
    :cond_2
    move v2, v9

    .line 312
    goto :goto_0

    .restart local v2    # "isKeyboardShowing":Z
    :cond_3
    move v8, v9

    .line 327
    goto :goto_1
.end method
