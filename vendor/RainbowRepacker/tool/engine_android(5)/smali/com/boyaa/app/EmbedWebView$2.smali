.class Lcom/boyaa/app/EmbedWebView$2;
.super Ljava/lang/Object;
.source "EmbedWebView.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/app/EmbedWebView;->newWebView(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/app/EmbedWebView;


# direct methods
.method constructor <init>(Lcom/boyaa/app/EmbedWebView;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/app/EmbedWebView$2;->this$0:Lcom/boyaa/app/EmbedWebView;

    .line 166
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 172
    iget-object v0, p0, Lcom/boyaa/app/EmbedWebView$2;->this$0:Lcom/boyaa/app/EmbedWebView;

    invoke-virtual {v0}, Lcom/boyaa/app/EmbedWebView;->goBackWebView()V

    .line 173
    return-void
.end method
