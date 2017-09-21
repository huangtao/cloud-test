.class public final Lcom/boyaa/godsdk/core/GodSDKPush$BundleKey;
.super Ljava/lang/Object;
.source "GodSDKPush.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/boyaa/godsdk/core/GodSDKPush;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "BundleKey"
.end annotation


# static fields
.field public static final PUSH_NAME:Ljava/lang/String; = "pushName"

.field public static final RAW_DATA:Ljava/lang/String; = "rawData"

.field public static final REGISTRATION_ID:Ljava/lang/String; = "registrationId"


# instance fields
.field final synthetic this$0:Lcom/boyaa/godsdk/core/GodSDKPush;


# direct methods
.method public constructor <init>(Lcom/boyaa/godsdk/core/GodSDKPush;)V
    .locals 0

    .prologue
    .line 39
    iput-object p1, p0, Lcom/boyaa/godsdk/core/GodSDKPush$BundleKey;->this$0:Lcom/boyaa/godsdk/core/GodSDKPush;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
