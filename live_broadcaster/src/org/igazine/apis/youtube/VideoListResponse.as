package org.igazine.apis.youtube {
	
/**
 * 
 * Live Broadcaster
 * Live Streaming Software for Mac / Windows
 * Project Copyright (c) 2014 - 2017 Yatko (LLC) and Kalman Venczel
 * File/Lib Copyright (c) 2017 Tamas Sopronyi & Yatko (LLC)
 * Licensed under GNU General Public License v3.0, with Runtime Library Exception
 * This source file is part of the cameleon.live project - https://www.cameleon.live
 * 
 * See https://app.h7.org/cameleon/ for project information and documentation
 * See https://app.h7.org/cameleon/LICENSE.txt for license information
 * See https://app.h7.org/cameleon/CONTRIBUTORS.txt for list of project authors
 *  
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 * 
 */
 
/**
 * 
 * ActionScript file
 * Copyright (c) 2017 Tamas Sopronyi & Yatko (LLC)
 * Author: Tamas Sopronyi, 2017
 * 
 */
	
	import com.adobe.serialization.json.JSON;
	
	public class VideoListResponse implements IResource {
		
		private var _object:Object = new Object();
		private var _items:Array;
		
		public function VideoListResponse() {
			
		}
		
		public static function create( value:Object ):VideoListResponse {
			
			var vlr:VideoListResponse = new VideoListResponse();
			vlr._object = value;
			vlr._items = new Array();
			
			if ( ( value.items as Array ).length > 0 ) {
				
				for ( var i:int = 0; i < value.items.length; i++ ) {
					
					var v:Video = Video.create( value.items[i] );
					vlr._items.push( v );
					
				}
				
			}
			
			return vlr;
			
		}
		
		
		/* INTERFACE org.igazine.apis.youtube.IResource */
		
		public function get json():String {
			
			return com.adobe.serialization.json.JSON.encode( _object );
			
		}
		
		public function get object():Object {
			
			return _object;
			
		}
		
		public function update(value:Object):void {
			
			for ( var i:String in value ) _object[i] = value[i];
			
			if ( value && value.items ) {
				
				_items = new Array();
				if ( ( value.items as Array ).length > 0 ) {
					
					for ( var j:int = 0; j < value.items.length; j++ ) {
						
						var v:Video = Video.create( value.items[j] );
						_items.push( v );
						
					}
					
				}
				
			}
		}
		
		public function dispose():void {
			
			_object = null;
			_items = null
			
		}
		
		public function get items():Array {
			
			return _items;
			
		}
		
	}

}