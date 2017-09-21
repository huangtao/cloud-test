.class public Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;
.super Ljava/lang/Object;
.source "WebViewImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/boyaa/engine/device/WebViewImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "WebViewParam"
.end annotation


# instance fields
.field public backgroundColor:I

.field public buttonView:Lcom/boyaa/engine/device/WebViewImpl$ButtonView;

.field public childLayout:Landroid/widget/FrameLayout;

.field public closeBtnH:I

.field public closeBtnImageFile:Ljava/lang/String;

.field public closeBtnPos:I

.field public closeBtnW:I

.field public enableBackKey:Z

.field public enableBackOrForward:Z

.field public enableCache:Z

.field public enableHScroll:Z

.field public enableVScroll:Z

.field public hasLoadingBar:Z

.field public height:I

.field public id:I

.field public jsObj:Lcom/boyaa/engine/device/WebViewImpl$JsInterface;

.field public layout:Landroid/widget/FrameLayout;

.field public loadingBarImageFile:Ljava/lang/String;

.field public loadingBarImageH:I

.field public loadingBarImageW:I

.field public loadingBarText:Ljava/lang/String;

.field public loadingView:Lcom/boyaa/engine/device/WebViewImpl$LoadingView;

.field final synthetic this$0:Lcom/boyaa/engine/device/WebViewImpl;

.field public url:Ljava/lang/String;

.field public webview:Landroid/webkit/WebView;

.field public width:I

.field public x:I

.field public y:I


# direct methods
.method public constructor <init>(Lcom/boyaa/engine/device/WebViewImpl;)V
    .locals 4

    .prologue
    const/4 v3, -0x1

    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 119
    iput-object p1, p0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->this$0:Lcom/boyaa/engine/device/WebViewImpl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 120
    iput v3, p0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->closeBtnPos:I

    .line 121
    iput-boolean v1, p0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->hasLoadingBar:Z

    .line 122
    iput-boolean v1, p0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->enableCache:Z

    .line 123
    iput-boolean v1, p0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->enableBackOrForward:Z

    .line 124
    iput-boolean v1, p0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->enableBackKey:Z

    .line 125
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->enableVScroll:Z

    .line 126
    iput-boolean v1, p0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->enableHScroll:Z

    .line 127
    iput v3, p0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->backgroundColor:I

    .line 128
    iput-object v2, p0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->webview:Landroid/webkit/WebView;

    .line 129
    iput-object v2, p0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->layout:Landroid/widget/FrameLayout;

    .line 130
    iput-object v2, p0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->childLayout:Landroid/widget/FrameLayout;

    .line 131
    invoke-virtual {p1, p0}, Lcom/boyaa/engine/device/WebViewImpl;->createJS(Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;)Lcom/boyaa/engine/device/WebViewImpl$JsInterface;

    move-result-object v0

    iput-object v0, p0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->jsObj:Lcom/boyaa/engine/device/WebViewImpl$JsInterface;

    .line 132
    invoke-virtual {p1}, Lcom/boyaa/engine/device/WebViewImpl;->createLoadingView()Lcom/boyaa/engine/device/WebViewImpl$LoadingView;

    move-result-object v0

    iput-object v0, p0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->loadingView:Lcom/boyaa/engine/device/WebViewImpl$LoadingView;

    .line 133
    invoke-virtual {p1}, Lcom/boyaa/engine/device/WebViewImpl;->createButtonView()Lcom/boyaa/engine/device/WebViewImpl$ButtonView;

    move-result-object v0

    iput-object v0, p0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->buttonView:Lcom/boyaa/engine/device/WebViewImpl$ButtonView;

    .line 134
    return-void
.end method


# virtual methods
.method public createLayout()V
    .locals 11

    .prologue
    const/4 v10, -0x1

    .line 148
    iget-object v4, p0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->layout:Landroid/widget/FrameLayout;

    if-nez v4, :cond_0

    .line 149
    new-instance v4, Landroid/widget/FrameLayout;

    invoke-static {}, Lcom/boyaa/engine/device/Device;->getActivity()Landroid/app/Activity;

    move-result-object v5

    invoke-direct {v4, v5}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object v4, p0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->layout:Landroid/widget/FrameLayout;

    .line 150
    invoke-static {}, Lcom/boyaa/engine/device/Device;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v4

    invoke-interface {v4}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    .line 151
    .local v0, "display":Landroid/view/Display;
    new-instance v1, Landroid/graphics/Point;

    invoke-direct {v1}, Landroid/graphics/Point;-><init>()V

    .line 152
    .local v1, "pt":Landroid/graphics/Point;
    invoke-virtual {v0, v1}, Landroid/view/Display;->getSize(Landroid/graphics/Point;)V

    .line 153
    iget v3, v1, Landroid/graphics/Point;->x:I

    .line 154
    .local v3, "sw":I
    iget v2, v1, Landroid/graphics/Point;->y:I

    .line 156
    .local v2, "sh":I
    iget-object v4, p0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->layout:Landroid/widget/FrameLayout;

    iget v5, p0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->x:I

    iget v6, p0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->y:I

    iget v7, p0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->width:I

    sub-int v7, v3, v7

    iget v8, p0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->x:I

    sub-int/2addr v7, v8

    iget v8, p0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->height:I

    sub-int v8, v2, v8

    iget v9, p0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->y:I

    sub-int/2addr v8, v9

    invoke-virtual {v4, v5, v6, v7, v8}, Landroid/widget/FrameLayout;->setPadding(IIII)V

    .line 157
    invoke-static {}, Lcom/boyaa/engine/device/Device;->getActivity()Landroid/app/Activity;

    move-result-object v4

    iget-object v5, p0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->layout:Landroid/widget/FrameLayout;

    new-instance v6, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v6, v10, v10}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v4, v5, v6}, Landroid/app/Activity;->addContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 159
    iget v4, p0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->closeBtnPos:I

    if-lez v4, :cond_1

    .line 160
    new-instance v4, Landroid/widget/FrameLayout;

    invoke-static {}, Lcom/boyaa/engine/device/Device;->getActivity()Landroid/app/Activity;

    move-result-object v5

    invoke-direct {v4, v5}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object v4, p0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->childLayout:Landroid/widget/FrameLayout;

    .line 161
    iget-object v4, p0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->childLayout:Landroid/widget/FrameLayout;

    iget v5, p0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->closeBtnW:I

    div-int/lit8 v5, v5, 0x2

    iget v6, p0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->closeBtnH:I

    div-int/lit8 v6, v6, 0x2

    iget v7, p0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->closeBtnW:I

    div-int/lit8 v7, v7, 0x2

    iget v8, p0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->closeBtnH:I

    div-int/lit8 v8, v8, 0x2

    invoke-virtual {v4, v5, v6, v7, v8}, Landroid/widget/FrameLayout;->setPadding(IIII)V

    .line 162
    iget-object v4, p0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->layout:Landroid/widget/FrameLayout;

    iget-object v5, p0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->childLayout:Landroid/widget/FrameLayout;

    invoke-virtual {v4, v5}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 163
    iget-object v4, p0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->childLayout:Landroid/widget/FrameLayout;

    iget-object v5, p0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->webview:Landroid/webkit/WebView;

    new-instance v6, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v6, v10, v10}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v4, v5, v6}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 168
    .end local v0    # "display":Landroid/view/Display;
    .end local v1    # "pt":Landroid/graphics/Point;
    .end local v2    # "sh":I
    .end local v3    # "sw":I
    :cond_0
    :goto_0
    return-void

    .line 165
    .restart local v0    # "display":Landroid/view/Display;
    .restart local v1    # "pt":Landroid/graphics/Point;
    .restart local v2    # "sh":I
    .restart local v3    # "sw":I
    :cond_1
    iget-object v4, p0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->layout:Landroid/widget/FrameLayout;

    iget-object v5, p0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->webview:Landroid/webkit/WebView;

    new-instance v6, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v6, v10, v10}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v4, v5, v6}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_0
.end method

.method public destroyLayout()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 137
    iget-object v0, p0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->layout:Landroid/widget/FrameLayout;

    if-eqz v0, :cond_0

    .line 138
    iget-object v0, p0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->layout:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->removeAllViews()V

    .line 139
    iget-object v0, p0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->webview:Landroid/webkit/WebView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setVisibility(I)V

    .line 140
    iget-object v0, p0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->webview:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->destroy()V

    .line 141
    iput-object v2, p0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->webview:Landroid/webkit/WebView;

    .line 142
    iput-object v2, p0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->layout:Landroid/widget/FrameLayout;

    .line 143
    iput-object v2, p0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->childLayout:Landroid/widget/FrameLayout;

    .line 145
    :cond_0
    return-void
.end method

.method public getBackgroundRGB()I
    .locals 4

    .prologue
    const/4 v1, 0x0

    const/4 v3, 0x6

    .line 213
    iget v2, p0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->backgroundColor:I

    if-gez v2, :cond_0

    .line 224
    :goto_0
    return v1

    .line 215
    :cond_0
    iget v2, p0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->backgroundColor:I

    invoke-static {v2}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v0

    .line 216
    .local v0, "hex":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-le v2, v3, :cond_2

    .line 217
    invoke-virtual {v0, v1, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 223
    :goto_1
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "#"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 224
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v1

    goto :goto_0

    .line 220
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "0"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 219
    :cond_2
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-lt v1, v3, :cond_1

    goto :goto_1
.end method

.method public resetLayout()V
    .locals 10

    .prologue
    .line 171
    iget-object v4, p0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->layout:Landroid/widget/FrameLayout;

    if-eqz v4, :cond_0

    .line 172
    invoke-static {}, Lcom/boyaa/engine/device/Device;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v4

    invoke-interface {v4}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    .line 173
    .local v0, "display":Landroid/view/Display;
    new-instance v1, Landroid/graphics/Point;

    invoke-direct {v1}, Landroid/graphics/Point;-><init>()V

    .line 174
    .local v1, "pt":Landroid/graphics/Point;
    invoke-virtual {v0, v1}, Landroid/view/Display;->getSize(Landroid/graphics/Point;)V

    .line 175
    iget v3, v1, Landroid/graphics/Point;->x:I

    .line 176
    .local v3, "sw":I
    iget v2, v1, Landroid/graphics/Point;->y:I

    .line 177
    .local v2, "sh":I
    iget-object v4, p0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->layout:Landroid/widget/FrameLayout;

    iget v5, p0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->x:I

    iget v6, p0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->y:I

    iget v7, p0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->width:I

    sub-int v7, v3, v7

    iget v8, p0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->x:I

    sub-int/2addr v7, v8

    iget v8, p0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->height:I

    sub-int v8, v2, v8

    iget v9, p0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->y:I

    sub-int/2addr v8, v9

    invoke-virtual {v4, v5, v6, v7, v8}, Landroid/widget/FrameLayout;->setPadding(IIII)V

    .line 178
    iget-object v4, p0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->childLayout:Landroid/widget/FrameLayout;

    if-eqz v4, :cond_0

    .line 179
    iget-object v4, p0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->childLayout:Landroid/widget/FrameLayout;

    iget v5, p0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->closeBtnW:I

    div-int/lit8 v5, v5, 0x2

    iget v6, p0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->closeBtnH:I

    div-int/lit8 v6, v6, 0x2

    iget v7, p0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->closeBtnW:I

    div-int/lit8 v7, v7, 0x2

    iget v8, p0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->closeBtnH:I

    div-int/lit8 v8, v8, 0x2

    invoke-virtual {v4, v5, v6, v7, v8}, Landroid/widget/FrameLayout;->setPadding(IIII)V

    .line 182
    .end local v0    # "display":Landroid/view/Display;
    .end local v1    # "pt":Landroid/graphics/Point;
    .end local v2    # "sh":I
    .end local v3    # "sw":I
    :cond_0
    return-void
.end method
